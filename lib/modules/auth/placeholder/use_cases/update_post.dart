import '../entities/post.dart';
import '../repositories/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository repository;

  UpdatePostUseCase({required this.repository});

  Future<void> call(Post post) async {
    await repository.updatePost(post);
  }
}