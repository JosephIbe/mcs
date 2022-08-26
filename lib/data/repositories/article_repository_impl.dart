import 'package:news_ui/data/datasources/article_remote_data_source.dart';
import 'package:news_ui/data/models/articles_response_model.dart';
import 'package:news_ui/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {

  final ArticleRemoteDataSource dataSource;
  ArticleRepositoryImpl({required this.dataSource});

  @override
  Future<List<ArticlesModel>> getAllArticles() async {
    return await dataSource.getAllArticles();
  }

}