import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category.dart';
import 'package:news/screens/categories/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({super.key, required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports',
          bgColor: AppTheme.redColor,
          categoryType: appLocal.sports,
          imgUrl: 'assets/images/sports.png'),
      CategoryModel(
          id: 'general',
          bgColor: AppTheme.darkBlueColor,
          categoryType: appLocal.general,
          imgUrl: 'assets/images/politics.png'),
      CategoryModel(
          id: 'health',
          bgColor: AppTheme.roseColor,
          categoryType: appLocal.health,
          imgUrl: 'assets/images/health.png'),
      CategoryModel(
          id: 'business',
          bgColor: AppTheme.brownColor,
          categoryType: appLocal.business,
          imgUrl: 'assets/images/bussines.png'),
      CategoryModel(
          id: 'entertainment',
          bgColor: AppTheme.lightBlueColor,
          categoryType: appLocal.entertainment,
          imgUrl: 'assets/images/environment.png'),
      CategoryModel(
          id: 'science',
          bgColor: AppTheme.yellowColor,
          categoryType: appLocal.science,
          imgUrl: 'assets/images/science.png'),
    ];

    return Padding(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: .5 / .6,
                // mainAxisExtent: MediaQuery.of(context).size.height / 5,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategorySelected(categories[index]);
                },
                child: Category(
                  category: categories[index],
                  index: index,
                ),
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
