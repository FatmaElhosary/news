import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/sources_response/sources_response.dart';
import 'package:news/network/api_utils.dart';
import 'package:news/screens/home_screen/drawer.dart';

class SourcesScreen extends StatefulWidget {
  static const String routeName = 'sources';
  const SourcesScreen({super.key});

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  late Future<SourcesResponse> futureSources;
  @override
  void initState() {
    futureSources = ApiUtils.getSources('sports');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            title: const Text('Sports'),
          ),
          body: FutureBuilder<SourcesResponse>(
              future: futureSources,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data?.status);
                  return Center(child: Text(snapshot.data?.status ?? ''));
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text('${snapshot.error}'));
                }

                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}
