import 'package:flutter/material.dart';

class WaittingWidget extends StatelessWidget {
  const WaittingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
