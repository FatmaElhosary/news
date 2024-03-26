import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/widgets/waiting.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({super.key, required this.urlToImage});
  final String? urlToImage;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: CachedNetworkImage(
        imageUrl: urlToImage ?? "",
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,

        placeholder: (context, url) => const Padding(
          padding: EdgeInsets.all(18.0),
          child: WaittingWidget(),
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/photo.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        //Icon(Icons.error, color: AppTheme.redColor),
      ),
    );
  }
}
