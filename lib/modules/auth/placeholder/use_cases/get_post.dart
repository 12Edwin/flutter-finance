

import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPost {
  final PostRepository repository;

  GetPost({required this.repository});

  Future<Post> call(int id) async {
    return await repository.getPost(id);
  }
}