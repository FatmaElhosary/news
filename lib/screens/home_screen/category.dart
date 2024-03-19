import 'package:flutter/material.dart';
import 'package:news/models/category.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.bgColor,
          borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(25),
              topStart: Radius.circular(25),
              topEnd: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imgUrl),
          Text(
            category.categoryType,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
