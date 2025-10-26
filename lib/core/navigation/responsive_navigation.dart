import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';
import '../../features/chat/presentation/pages/responsive_chat_page.dart';
import '../../features/chat/presentation/pages/web_home_page.dart';
import '../../features/chat/presentation/pages/improved_desktop_chat_page.dart';
import '../../screens/home_screen.dart';
import '../../screens/health_tips_screen.dart';
import '../../screens/emergency_screen.dart';

class ResponsiveNavigation {
  static const String home = '/';
  static const String chat = '/chat';
  static const String healthTips = '/health-tips';
  static const String emergency = '/emergency';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => _getHomePage(context),
      chat: (context) => _getChatPage(context),
      healthTips: (context) => const HealthTipsScreen(),
      emergency: (context) => const EmergencyScreen(),
    };
  }

  /// Returns the appropriate home page based on device type
  static Widget _getHomePage(BuildContext context) {
    if (ResponsiveHelper.isWeb(context) ||
        ResponsiveHelper.isDesktop(context)) {
      return const WebHomePage();
    } else {
      return const HomeScreen();
    }
  }

  /// Returns the appropriate chat page based on device type
  static Widget _getChatPage(BuildContext context) {
    if (ResponsiveHelper.isWeb(context) ||
        ResponsiveHelper.isDesktop(context)) {
      return const ImprovedDesktopChatPage();
    } else {
      return const ResponsiveChatPage();
    }
  }

  static Widget buildResponsiveAppBar(
    BuildContext context, {
    required String title,
    List<Widget>? actions,
    Widget? leading,
  }) {
    if (ResponsiveHelper.isMobile(context)) {
      return AppBar(
        title: Text(title),
        actions: actions,
        leading: leading,
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      );
    } else if (ResponsiveHelper.isTablet(context)) {
      return AppBar(
        title: Text(title, style: const TextStyle(fontSize: 20)),
        actions: actions,
        leading: leading,
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
      );
    } else {
      return AppBar(
        title: Text(title, style: const TextStyle(fontSize: 22)),
        actions: actions,
        leading: leading,
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
      );
    }
  }

  static Widget buildResponsiveDrawer(BuildContext context) {
    if (ResponsiveHelper.isMobile(context)) {
      return _buildMobileDrawer(context);
    } else if (ResponsiveHelper.isTablet(context)) {
      return _buildTabletDrawer(context);
    } else {
      return _buildDesktopDrawer(context);
    }
  }

  static Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF2E7D32)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.medical_services,
                    color: Color(0xFF2E7D32),
                    size: 30,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'المساعد الطبي الذكي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, 'الرئيسية', Icons.home, home),
          _buildDrawerItem(context, 'المحادثة', Icons.chat, chat),
          _buildDrawerItem(
            context,
            'النصائح الصحية',
            Icons.favorite,
            healthTips,
          ),
          _buildDrawerItem(context, 'الطوارئ', Icons.emergency, emergency),
          const Divider(),
          _buildDrawerItem(context, 'الإعدادات', Icons.settings, '/settings'),
          _buildDrawerItem(context, 'المساعدة', Icons.help, '/help'),
        ],
      ),
    );
  }

  static Widget _buildTabletDrawer(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[50],
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(color: Color(0xFF2E7D32)),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medical_services, color: Colors.white, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'المساعد الطبي الذكي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDrawerItem(context, 'الرئيسية', Icons.home, home),
                _buildDrawerItem(context, 'المحادثة', Icons.chat, chat),
                _buildDrawerItem(
                  context,
                  'النصائح الصحية',
                  Icons.favorite,
                  healthTips,
                ),
                _buildDrawerItem(
                  context,
                  'الطوارئ',
                  Icons.emergency,
                  emergency,
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  'الإعدادات',
                  Icons.settings,
                  '/settings',
                ),
                _buildDrawerItem(context, 'المساعدة', Icons.help, '/help'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDesktopDrawer(BuildContext context) {
    return Container(
      width: 280,
      color: Colors.grey[50],
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(color: Color(0xFF2E7D32)),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medical_services, color: Colors.white, size: 50),
                  SizedBox(height: 12),
                  Text(
                    'المساعد الطبي الذكي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'صحتك في أيد أمينة',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildDrawerItem(context, 'الرئيسية', Icons.home, home),
                _buildDrawerItem(context, 'المحادثة', Icons.chat, chat),
                _buildDrawerItem(
                  context,
                  'النصائح الصحية',
                  Icons.favorite,
                  healthTips,
                ),
                _buildDrawerItem(
                  context,
                  'الطوارئ',
                  Icons.emergency,
                  emergency,
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  'الإعدادات',
                  Icons.settings,
                  '/settings',
                ),
                _buildDrawerItem(context, 'المساعدة', Icons.help, '/help'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF2E7D32)),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
