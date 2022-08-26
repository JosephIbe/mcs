import 'package:get_it/get_it.dart';

import 'package:news_ui/data/core/api_client.dart';

import 'package:news_ui/data/datasources/article_remote_data_source.dart';
import 'package:news_ui/data/repositories/article_repository_impl.dart';

import 'package:news_ui/domain/repositories/article_repository.dart';

final getItInstance = GetIt.I;

Future<void> init() async {
  getItInstance.registerLazySingleton<APIClient>(() => APIClient());

  getItInstance.registerLazySingleton<ArticleRemoteDataSource>(
          () => ArticleRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<ArticleRepository>(
          () => ArticleRepositoryImpl(dataSource: getItInstance()));

}