import 'package:flutter/material.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/network/api_utils.dart';
import 'package:news/screens/news/news_details.dart';
import 'package:news/screens/news/news_item.dart';
import 'package:news/widgets/error.dart';
import 'package:news/widgets/waiting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.source});
  final Source source;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return FutureBuilder<NewsResponse>(
        future: ApiUtils.getNewsbySourceId(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorTab(errrorMsg: appLocal.somthingError);
          } else if (snapshot.hasData) {
            if (snapshot.data?.status != 'ok') {
              return ErrorTab(errrorMsg: '${snapshot.data?.message}');
            }
            if (snapshot.data?.articles == []) {
              return const Center(
                  child: Text(
                'No News',
                style: TextStyle(color: Colors.black),
              ));
            }
            //data
            List<Article> articles = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  NewsDetails(article:articles[index] ,)),
                ),
                child: NewsItem(
                  article: articles[index],
                ),
              ),
              itemCount: articles.length,
            );
          }
          // By default, show a loading spinner.
          return const WaittingWidget();
        });
  }
}
