part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];

}

class ArticlesStateInitial extends ArticlesState {}

class ArticlesStateLoading extends ArticlesState {}

class ArticlesStateSuccess extends ArticlesState {
  final List<ArticlesModel> articles;
  const ArticlesStateSuccess({required this.articles});
}

class ArticlesStateFailure extends ArticlesState {
  final String errorMessage;
  const ArticlesStateFailure({required this.errorMessage});
}