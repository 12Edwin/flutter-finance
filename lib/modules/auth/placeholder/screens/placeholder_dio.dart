import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../use_cases/create_post.dart';
import '../use_cases/delete_post.dart';
import '../use_cases/get_post.dart';
import '../use_cases/update_post.dart';

class PlaceholderDio extends StatefulWidget {
  const PlaceholderDio({super.key});

  @override
  State<PlaceholderDio> createState() => _PlaceholderDioState();
}

class _PlaceholderDioState extends State<PlaceholderDio> {
  final PostRepository _postRepository = GetIt.instance<PostRepository>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  List<Post> _posts = [];
  Post? _selectedPost;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    // Fetch all posts
    final posts = await _postRepository.getPosts();
    setState(() {
      _posts = posts;
    });
  }

  Future<void> _getPost(int id) async {
    final post = await GetPost(repository: _postRepository).call(id);
    setState(() {
      _selectedPost = post;
    });
  }

  Future<void> _createPost() async {
    final post = Post(id: 0, userId: 1, title: _titleController.text, body: _bodyController.text);
    await CreatePost(repository: _postRepository).call(post);
    _fetchPosts();
  }

  Future<void> _updatePost() async {
    if (_selectedPost != null) {
      final updatedPost = Post(id: _selectedPost!.id, userId: _selectedPost!.userId, title: _titleController.text, body: _bodyController.text);
      await UpdatePostUseCase(repository: _postRepository).call(updatedPost);
      _fetchPosts();
    }
  }

  Future<void> _deletePost(int id) async {
    await DeletePostUseCase(repository: _postRepository).call(id.toString());
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD with Dio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _createPost,
                  child: const Text('Create'),
                ),
                ElevatedButton(
                  onPressed: _updatePost,
                  child: const Text('Update'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    onTap: () {
                      setState(() {
                        _selectedPost = post;
                        _titleController.text = post.title;
                        _bodyController.text = post.body;
                      });
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deletePost(post.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}