import 'package:flutter/material.dart';
import 'package:news_ui/common/constants/size_constants.dart';
import 'package:news_ui/common/constants/text_constants.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: const Center(
            child: Text(
              TextLiterals.bookmarks,
              style: TextStyle(
                  fontSize: Sizes.dimen_25
              ),
            ),
          ),
        ),
      ),
    );
  }

}