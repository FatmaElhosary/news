import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response.dart';
import 'package:news/network/api_utils.dart';
import 'package:news/screens/news/news_item.dart';
import 'package:news/widgets/waiting.dart';

class SearchArticles extends StatefulWidget {
  static const String routeName = 'search';
  const SearchArticles({super.key});

  @override
  State<SearchArticles> createState() => _SearchArticlesState();
}

class _SearchArticlesState extends State<SearchArticles> {
  late TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  late List<Article> articles;
  int totalArticles = 100;
  bool isLoading = false;
  @override
  void initState() {
    articles = [];
    searchController = TextEditingController(text: '');
    scrollController.addListener(loadMoreArticles);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
          appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: MediaQuery.of(context).size.height * .09,
              title: SearchBar(
                  controller: searchController,
                  hintText: 'Search Article',
                  hintStyle: MaterialStatePropertyAll(
                      Theme.of(context).textTheme.bodySmall),
                  onSubmitted: (value) {
                    getNews(searchController.text);
                  },
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                  backgroundColor:
                      MaterialStatePropertyAll(AppTheme.whiteColor),
                  trailing: <Widget>[
                    IconButton(
                      onPressed: () {
                        getNews(searchController.text);
                      },
                      icon: Icon(
                        Icons.search,
                        size: 35,
                        color: AppTheme.greenColor,
                      ),
                    )
                  ],
                  leading: IconButton(
                    onPressed: () {
                      searchController.clear();
                      articles = [];
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: AppTheme.greenColor,
                    ),
                  ))),
          body: ListView.builder(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: articles.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      NewsItem(article: articles[index]),
                      if (isLoading && index == articles.length - 1)
                        const WaittingWidget(),
                    ],
                  )),
        ));
  }

  Future<void> getNews(String key) async {
    setState(() {
      isLoading = true;
    });
    try {
      NewsResponse newsRes = await ApiUtils.getNewsbyQ(key);
      //articles = newsRes.articles ?? [];
      ///print(newsRes.message ?? '');
      totalArticles = newsRes.totalResults ?? 100;
      articles.addAll(newsRes.articles ?? []);
      isLoading = false;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  loadMoreArticles() {
    print('loadmore');
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        articles.length < totalArticles) {
      getNews(searchController.text);
    }
  }
}
 /*  FutureBuilder<NewsResponse>(
                future: callSearch(searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) =>
                            NewsItem(article: articles[index]));
                  } else if (snapshot.hasError) {
                    return const ErrorTab(
                      errrorMsg: 'Error',
                    );
                  }
                  return const WaittingWidget();
                }) */