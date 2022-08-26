import 'package:flutter/material.dart';

import 'package:news_ui/common/constants/size_constants.dart';
import 'package:news_ui/common/constants/text_constants.dart';

import 'package:news_ui/data/models/articles_response_model.dart';

import 'package:timeago/timeago.dart' as timeago;

dynamic w, h;

class ArticleItem extends StatelessWidget {

  final ArticlesModel article;

  const ArticleItem({
    required this.article,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final dt = DateTime.parse(article.publishedAt!);
    final timeAgo = timeago.format(dt);

    return Card(
      color: Colors.white,
      elevation: Sizes.dimen_2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10)),
      ),
      child: Container(
          constraints: BoxConstraints(
              minWidth: w,
              maxWidth: w,
              minHeight: h * 0.3
          ),
          padding: const EdgeInsets.all(Sizes.dimen_8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: Sizes.dimen_35,
                        height: Sizes.dimen_35,
                        decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            shape: BoxShape.circle
                        ),
                      ),
                      const SizedBox(width: Sizes.dimen_5,),
                      Text(
                          article.author!.substring(0, 4),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: Sizes.dimen_16,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ],
                  ),

                  Text(
                      // article.publishedAt!.substring(0, 15),
                      timeAgo,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: Sizes.dimen_12,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                ],
              ),
              const Divider(),

              Text(
                  article.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: Sizes.dimen_20,
                    fontWeight: FontWeight.bold,
                  )
              ),
              const SizedBox(height: Sizes.dimen_10,),
              Text(
                  article.description!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: Sizes.dimen_14,
                    fontWeight: FontWeight.w600,
                  )
              ),
              const SizedBox(height: Sizes.dimen_10,),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10)),
                  ),
                  fixedSize: Size(w, Sizes.dimen_50),
                  primary: Colors.deepPurple,
                  splashFactory: InkSplash.splashFactory
                ),
                child: const Text(
                  TextLiterals.readMore,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ),
            ],
          )
      ),
    );
  }

}