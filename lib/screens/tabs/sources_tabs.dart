import 'package:flutter/material.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/screens/news/news_list.dart';
import 'package:news/screens/tabs/tabbar_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs({super.key, required this.sources});
  final List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            indicatorColor: Colors.transparent,
            dividerHeight: 0,
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            isScrollable: true,
            tabs: widget.sources
                .map((source) => TabbarItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sources.indexOf(source),
                    ))
                .toList(),
          ),
        ),
        Expanded(
            child: NewsList(source: widget.sources[selectedIndex]))
      ],
    );
  }
}
