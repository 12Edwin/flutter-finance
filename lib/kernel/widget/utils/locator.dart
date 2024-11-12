import 'package:finance_app/modules/auth/placeholder/use_cases/get_all_posts.dart';
import 'package:finance_app/modules/auth/placeholder/use_cases/update_post.dart';
import 'package:get_it/get_it.dart';
import '../../../modules/auth/placeholder/datasource/post_remote_data_source.dart';
import '../../../modules/auth/placeholder/repositories/post_repository.dart';
import '../../../modules/auth/placeholder/use_cases/create_post.dart';
import '../../../modules/auth/placeholder/use_cases/delete_post.dart';
import '../../../modules/auth/placeholder/use_cases/get_post.dart';
import 'dio_client.dart';


final locator = GetIt.instance;

void setupLocator() {
  // Registro de dependencias
  locator.registerLazySingleton(() => DioClient(baseUrl: 'https://jsonplaceholder.typicode.com'));
  
  // Data Sources
  locator.registerFactory<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(dioClient: locator()));

  // Repositorios
  locator.registerFactory<PostRepository>(() => PostRepositoryImpl(remoteDataSource: locator()));

  // Casos de uso
  locator.registerFactory(() => GetPost(repository: locator()));
  locator.registerFactory(() => GetAllPosts(repository: locator()));
  locator.registerFactory(() => CreatePost(repository: locator()));
  locator.registerFactory(() => UpdatePostUseCase(repository: locator()));
  locator.registerFactory(() => DeletePostUseCase(repository: locator()));
}
