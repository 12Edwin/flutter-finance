import '../repositories/post_repository.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase({required this.repository});

  Future<void> call(String postId) async {
    await repository.deletePost(int.parse(postId));
  }
}