import 'package:bookly/core/utilities/assets.dart';
import 'package:bookly/core/utilities/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double logoHeight;

          if (constraints.maxWidth >= 1200) {
            // Desktop / Large screens
            logoHeight = 40;
          } else if (constraints.maxWidth >= 800) {
            // Tablet
            logoHeight = 32;
          } else {
            // Mobile
            logoHeight = 24;
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetsData.logo, height: logoHeight),
              IconButton(
                onPressed: () => GoRouter.of(context).push(Routes.searchView),
                icon: Icon(FontAwesomeIcons.magnifyingGlass, size: logoHeight),
              ),
            ],
          );
        },
      ),
    );
  }
}
