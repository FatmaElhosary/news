import 'package:flutter/material.dart';
import 'package:news/models/category.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.bgColor,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(index.isEven ? 25 : 0),
              bottomEnd: Radius.circular(index.isOdd ? 25 : 0),
              topStart: const Radius.circular(25),
              topEnd: const Radius.circular(25))),
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
