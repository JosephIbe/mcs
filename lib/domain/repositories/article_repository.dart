import 'package:news_ui/data/models/articles_response_model.dart';

abstract class ArticleRepository {
  Future<List<ArticlesModel>> getAllArticles();
}