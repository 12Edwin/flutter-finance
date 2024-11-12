
import 'package:dio/dio.dart';

import '../../../../kernel/widget/utils/dio_client.dart';
import '../entities/post.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
  Future<Post> createPost(PostModel post);
  Future<Post> updatePost(PostModel post);
  Future<Post> deletePost(int id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioClient dioClient;

  PostRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<Post> getPost(int id) async {
    try {
      final response = await dioClient.dio.get('/posts/$id');
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await dioClient.dio.get('/posts');
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<Post> createPost(PostModel post) async {
    try {
      final response = await dioClient.dio.post('/posts', data: post.toJson());
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }

  @override
  Future<Post> updatePost(PostModel post) async {
    try {
      final response = await dioClient.dio.put('/posts/${post.id}', data: post.toJson());
      print(response);
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update user');
    }
  }

  @override
  Future<Post> deletePost(int id) async {
    try {
      final response = await dioClient.dio.delete('/posts/$id');
      if (response.statusCode == 200 && response.data != null && response.data.isNotEmpty) {
        return PostModel.fromJson(response.data);
      } else {
        return PostModel(id: id, userId: 0, title: '', body: '');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }
}
