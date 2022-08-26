import 'package:flutter/material.dart';

import 'package:news_ui/common/constants/text_constants.dart';
import 'package:news_ui/common/constants/size_constants.dart';

import 'package:news_ui/presentation/journeys/home.dart';
import 'package:news_ui/presentation/journeys/explore.dart';
import 'package:news_ui/presentation/journeys/bookmarks.dart';
import 'package:news_ui/presentation/journeys/settings.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  var currentIndex = 0;
  var children = const [
    Home(),
    Explore(),
    Bookmarks(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: children[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            elevation: Sizes.dimen_2,
            onTap: (index) => setState(()=> currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: TextLiterals.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: TextLiterals.search,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: TextLiterals.bookmarks,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: TextLiterals.settings,
              ),
            ],
          ),
        )
    );
  }

}