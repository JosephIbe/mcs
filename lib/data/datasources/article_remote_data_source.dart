import 'package:news_ui/data/core/api_client.dart';
import 'package:news_ui/data/models/articles_response_model.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticlesModel>> getAllArticles();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {

  final APIClient client;
  ArticleRemoteDataSourceImpl({required this.client});

  List<ArticlesModel> allArticles = [];

  @override
  Future<List<ArticlesModel>> getAllArticles() async {
    final data = await client.getResource();
    allArticles = ArticlesResponseModel.fromJson(data).articles!;
    return allArticles;
  }

}