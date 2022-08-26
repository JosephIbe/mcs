import 'package:flutter/material.dart';

import 'package:news_ui/presentation/blocs/articles/articles_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ui/common/constants/size_constants.dart';

import 'package:news_ui/data/models/articles_response_model.dart';
import 'package:news_ui/presentation/widgets/article_item.dart';

class ArticlesList extends StatelessWidget {

  // final List<ArticlesModel> articles;
  const ArticlesList({
    // required this.articles,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state){
        if(state is ArticlesStateLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is ArticlesStateFailure){
          return Center(
            child: Text(state.errorMessage),
          );
        }
        if(state is ArticlesStateSuccess){
          return ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.articles.length,
            itemBuilder: (context, index) => ArticleItem(article: state.articles[index]),
            separatorBuilder: (context, index) => const SizedBox(height: Sizes.dimen_20,),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}