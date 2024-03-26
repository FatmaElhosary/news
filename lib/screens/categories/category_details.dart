import 'package:flutter/material.dart';
import 'package:news/models/category.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/network/api_utils.dart';
import 'package:news/screens/tabs/sources_tabs.dart';
import 'package:news/widgets/error.dart';
import 'package:news/widgets/waiting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'sources';
  const CategoryDetails({super.key, required this.category});
  final CategoryModel category;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails>
    with TickerProviderStateMixin {
  late Future<SourcesResponse> futureSources;
  @override
  void initState() {
    futureSources = ApiUtils.getSources(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return FutureBuilder<SourcesResponse>(
        future: futureSources,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorTab(errrorMsg: appLocal.somthingError);
          } else if (snapshot.hasData) {
            final sources = snapshot.data?.sources;
            if (snapshot.data?.status != 'ok') {
              return ErrorTab(errrorMsg: '${snapshot.data?.message}');
            }
            ////data///////////////
            else if (sources == null || sources == []) {
              return Center(
                  child: Text(
                '${appLocal.noSources} ${widget.category}',
                style: const TextStyle(color: Colors.black),
              ));
            }
            return SourcesTabs(
              sources: sources,
            );
          }

          // By default, show a loading spinner.
          return const WaittingWidget();
        });
  }
}
