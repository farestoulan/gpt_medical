import 'package:flutter/material.dart';
import 'package:gpt_model/features/home/presentation/screens/responsive_home_screen.dart';
import 'package:gpt_model/features/chat/presentation/pages/responsive_chat_page.dart';
import 'package:gpt_model/features/medical/presentation/screens/health_tips_screen.dart';
import 'package:gpt_model/features/medical/presentation/screens/emergency_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String healthTips = '/health-tips';
  static const String emergency = '/emergency';

  // Navigation helpers
  static Future<dynamic>? navigateTo(BuildContext context, String route) =>
      Navigator.pushNamed(context, route);

  static Future<dynamic>? navigateAndReplace(
    BuildContext context,
    String route,
  ) => Navigator.pushReplacementNamed(context, route);

  static void navigateAndFinish(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
  }

  static Future<dynamic>? navigateWithArgs(
    BuildContext context,
    String route,
    Object? args,
  ) => Navigator.pushNamed(context, route, arguments: args);
}

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const ResponsiveHomeScreen(),
          settings: settings,
        );

      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => const ResponsiveChatPage(),
          settings: settings,
        );

      case Routes.healthTips:
        return MaterialPageRoute(
          builder: (_) => const HealthTipsScreen(),
          settings: settings,
        );

      case Routes.emergency:
        return MaterialPageRoute(
          builder: (_) => const EmergencyScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) => const Scaffold(
                body: Center(child: Text('No route defined for this path')),
              ),
          settings: settings,
        );
    }
  }
}
