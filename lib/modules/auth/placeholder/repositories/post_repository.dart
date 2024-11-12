
import '../datasource/post_remote_data_source.dart';
import '../entities/post.dart';
import '../models/post_model.dart';

abstract class PostRepository {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
  Future<Post> createPost(Post post);
  Future<Post> updatePost(Post post);
  Future<Post> deletePost(int id);
}

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Post> getPost(int id) async {
    return await remoteDataSource.getPost(id);
  }

  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getPosts();
  }

  @override
  Future<Post> createPost(Post post) async {
    final postModel = PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
    return await remoteDataSource.createPost(postModel);
  }

  @override
  Future<Post> updatePost(Post post) async {
    final postModel = PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
    return await remoteDataSource.updatePost(postModel);
  }

  @override
  Future<Post> deletePost(int id) async {
    return await remoteDataSource.deletePost(id);
  }
}
