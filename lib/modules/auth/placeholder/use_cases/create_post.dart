

import '../entities/post.dart';
import '../repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost({required this.repository});

  Future<Post> call(Post post) async {
    return await repository.createPost(post);
  }
}