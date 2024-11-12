import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetAllPosts{
  final PostRepository repository;

  GetAllPosts({required this.repository});

  Future<List<Post>> execute() async {
    return await repository.getPosts();
  }
}