import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category.dart';
import 'package:news/screens/home_screen/category.dart';
import 'package:news/screens/home_screen/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = 'CategoriesScreen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    List<CategoryModel> categories = [
      CategoryModel(
          bgColor: AppTheme.redColor,
          categoryType: appLocal.sports,
          imgUrl: 'assets/images/sports.png'),
      CategoryModel(
          bgColor: AppTheme.darkBlueColor,
          categoryType: appLocal.politics,
          imgUrl: 'assets/images/politics.png'),
      CategoryModel(
          bgColor: AppTheme.roseColor,
          categoryType: appLocal.health,
          imgUrl: 'assets/images/health.png'),
      CategoryModel(
          bgColor: AppTheme.brownColor,
          categoryType: appLocal.bussines,
          imgUrl: 'assets/images/bussines.png'),
      CategoryModel(
          bgColor: AppTheme.lightBlueColor,
          categoryType: appLocal.environment,
          imgUrl: 'assets/images/environment.png'),
      CategoryModel(
          bgColor: AppTheme.yellowColor,
          categoryType: appLocal.science,
          imgUrl: 'assets/images/science.png'),
    ];

    return Stack(
      children: [
      Container(
            color: AppTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        Scaffold(
          drawer: const DrawerWidget(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(appLocal.newsApp),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20,
                vertical: MediaQuery.of(context).size.height / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocal.pickCategory,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: MediaQuery.of(context).size.height / 5,
                    ),
                    itemBuilder: (context, index) =>
                        Category(category: categories[index]),
                    itemCount: categories.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
