import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class ErrorTab extends StatelessWidget {
  const ErrorTab({super.key, required this.errrorMsg});
  final String errrorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errrorMsg,
      style: TextStyle(color: AppTheme.redColor),
    ));
  }
}
