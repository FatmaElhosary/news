import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_response.dart';
import 'package:news/screens/news/article_img.dart';
import 'package:news/widgets/waiting.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticleImage(
            urlToImage: article.urlToImage,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.source?.name ?? '',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            article.title ?? '',
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF42505C)),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              article.publishedAt ?? '',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
