import 'package:flutter/material.dart';
import 'package:gpt_model/features/home/presentation/screens/web_home_page.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'mobile_home_screen.dart';
import 'tablet_home_screen.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  const ResponsiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= ResponsiveHelper.desktopBreakpoint) {
      return const WebHomePage();
    } else if (width >= ResponsiveHelper.tabletBreakpoint) {
      return const TabletHomeScreen();
    } else {
      return const MobileHomeScreen();
    }
  }
}
