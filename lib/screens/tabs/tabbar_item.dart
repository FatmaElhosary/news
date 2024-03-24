import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/sources_response.dart';

class TabbarItem extends StatelessWidget {
  const TabbarItem({super.key, required this.source, required this.isSelected});
  final Source source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.greenColor, width: 2),
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppTheme.greenColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: isSelected ? AppTheme.whiteColor : AppTheme.greenColor),
      ),
    );
  }
}
