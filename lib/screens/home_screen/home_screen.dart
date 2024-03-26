import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category.dart';
import 'package:news/screens/categories/categories_items.dart';
import 'package:news/screens/categories/category_details.dart';
import 'package:news/screens/home_screen/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/screens/news/search_articles.dart';
import 'package:news/screens/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          image: const DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        drawer: DrawerWidget(
          onDrowerItemSelected: onDrowerItemSelected,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          title: Text(categorySelected != null
              ? categorySelected!.categoryType
              : selectedDrawerItem == DrawerItem.categories
                  ? appLocal.newsApp
                  : appLocal.settings),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchArticles.routeName);
                },
                icon: const Icon(
                  Icons.search,
                  size: 35,
                ))
          ],
        ),
        body: categorySelected != null
            ? CategoryDetails(
                category: categorySelected!,
              )
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesItems(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsBody(),
      ),
    );
  }

  var selectedDrawerItem = DrawerItem.categories;
  CategoryModel? categorySelected;
  void onDrowerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    categorySelected = null;
    Navigator.of(context).pop();
    setState(() {});
  }

  void onCategorySelected(CategoryModel category) {
    categorySelected = category;
    setState(() {});
  }
}
