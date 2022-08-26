import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pedantic/pedantic.dart';
import 'package:news_ui/di/injector.dart' as injector;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_ui/utils/bloc_observer.dart';

import 'package:news_ui/presentation/blocs/articles/articles_bloc.dart';
import 'package:news_ui/presentation/journeys/landing.dart';

import 'data/repositories/article_repository_impl.dart';
import 'domain/repositories/article_repository.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(injector.init());

  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
      MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ArticleRepository>(
              create: (_)=> ArticleRepositoryImpl(dataSource: injector.getItInstance()),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ArticlesBloc>(
                create: (context) {
                  final repo = context.read<ArticleRepository>();
                  return ArticlesBloc(repo)..add(GetArticlesEvent());
                },
              )
            ],
            child: const ArticlesApp(),
          )
      )
  ));

}

class ArticlesApp extends StatelessWidget {

  const ArticlesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      // home: const Landing(),
      home: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state){
          if(state is ArticlesStateLoading){
            return const Landing();
          }
          return const Landing();
        },
      ),
    );
  }

}