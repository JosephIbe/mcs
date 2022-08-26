import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_ui/data/models/articles_response_model.dart';
import 'package:news_ui/domain/repositories/article_repository.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(ArticleRepository repository) : super(ArticlesStateInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      emit(ArticlesStateLoading());
      final data = await repository.getAllArticles();
      if(data.isNotEmpty){
        emit(ArticlesStateSuccess(articles: data));
      } else {
        emit(const ArticlesStateFailure(errorMessage: 'Could Not Load Articles'));
      }
    });
  }
}
