import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 6,
          color: Theme.of(context).primaryColor,
          child: Text(
            appLocal.newsApp,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppTheme.whiteColor),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 20),
            width: MediaQuery.of(context).size.width / 1.5,
            color: AppTheme.whiteColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.list_outlined,
                      size: 32,
                      color: AppTheme.blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                       appLocal.categories,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 32,
                      color: AppTheme.blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        appLocal.settings,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
