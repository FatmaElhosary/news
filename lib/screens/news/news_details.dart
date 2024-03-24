import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response.dart';
import 'package:news/screens/news/news_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  final Article article;
  const NewsDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/pattern.png',
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(title: const Text('News Title')),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsItem(
                  article: article,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    article.content ?? '',
                    softWrap: true,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF42505C)),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          openUrl(article.url ?? '');
                        },
                        child: const Text(
                          'View Full Article',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF42505C)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
