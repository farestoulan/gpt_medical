import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_model/features/chat/presentation/pages/web_chat_page.dart';
import '../bloc/chat_bloc.dart';
import '../../../../core/common_widgets/widgets/adaptive_layout.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'mobile_chat_page.dart';
import 'tablet_chat_page.dart';
import 'desktop_chat_page.dart';

class ResponsiveChatPage extends StatelessWidget {
  const ResponsiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: const MobileChatPage(),
      tablet: const TabletChatPage(),
      desktop: const WebChatPage(),
      web: const WebChatPage(), // Use desktop layout for web
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdaptiveAppBar(title: 'المساعد الطبي الذكي'),
      body: AdaptiveContainer(
        child:
            ResponsiveHelper.isMobile(context)
                ? _buildMobileHome(context)
                : ResponsiveHelper.isTablet(context)
                ? _buildTabletHome(context)
                : _buildDesktopHome(context),
      ),
    );
  }

  Widget _buildMobileHome(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildWelcomeCard(context),
          const SizedBox(height: 24),
          _buildQuickActions(context),
          const SizedBox(height: 24),
          _buildFeaturesGrid(context, columns: 2),
        ],
      ),
    );
  }

  Widget _buildTabletHome(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildWelcomeCard(context),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(child: _buildQuickActions(context)),
              const SizedBox(width: 24),
              Expanded(child: _buildFeaturesGrid(context, columns: 2)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopHome(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          _buildWelcomeCard(context),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(flex: 2, child: _buildQuickActions(context)),
              const SizedBox(width: 32),
              Expanded(flex: 3, child: _buildFeaturesGrid(context, columns: 3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: ResponsiveHelper.getResponsivePadding(context),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              Icons.medical_services,
              size: ResponsiveHelper.getResponsiveValue(
                context,
                mobile: 48,
                tablet: 64,
                desktop: 80,
              ),
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'مرحباً بك في المساعد الطبي الذكي',
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 20,
                  tablet: 24,
                  desktop: 28,
                ),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'صحتك في أيد أمينة',
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 16,
                  tablet: 18,
                  desktop: 20,
                ),
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Card(
      child: Padding(
        padding: ResponsiveHelper.getResponsivePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الإجراءات السريعة',
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 18,
                  tablet: 20,
                  desktop: 22,
                ),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 16),
            _buildActionButton(context, 'ابدأ محادثة طبية', Icons.chat, () {
              Navigator.pushNamed(context, '/chat');
            }),
            const SizedBox(height: 12),
            _buildActionButton(
              context,
              'تحليل صورة طبية',
              Icons.camera_alt,
              () {
                // TODO: Implement image analysis
              },
            ),
            const SizedBox(height: 12),
            _buildActionButton(context, 'النصائح الصحية', Icons.favorite, () {
              Navigator.pushNamed(context, '/health-tips');
            }),
            const SizedBox(height: 12),
            _buildActionButton(context, 'الطوارئ', Icons.emergency, () {
              Navigator.pushNamed(context, '/emergency');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF2E7D32)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: ResponsiveHelper.getResponsiveFontSize(
                    context,
                    mobile: 16,
                    tablet: 16,
                    desktop: 18,
                  ),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesGrid(BuildContext context, {required int columns}) {
    final features = [
      {
        'title': 'محادثة ذكية',
        'icon': Icons.chat_bubble_outline,
        'color': Colors.blue,
      },
      {'title': 'تحليل الصور', 'icon': Icons.camera_alt, 'color': Colors.green},
      {'title': 'النصائح الصحية', 'icon': Icons.favorite, 'color': Colors.red},
      {'title': 'الطوارئ', 'icon': Icons.emergency, 'color': Colors.orange},
      {'title': 'التاريخ الطبي', 'icon': Icons.history, 'color': Colors.purple},
      {'title': 'الإعدادات', 'icon': Icons.settings, 'color': Colors.grey},
    ];

    return Card(
      child: Padding(
        padding: ResponsiveHelper.getResponsivePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'المميزات',
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 18,
                  tablet: 20,
                  desktop: 22,
                ),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 16),
            AdaptiveGrid(
              children:
                  features.map((feature) {
                    return Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          // TODO: Navigate to feature
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Icon(
                                feature['icon'] as IconData,
                                size: ResponsiveHelper.getResponsiveValue(
                                  context,
                                  mobile: 32,
                                  tablet: 40,
                                  desktop: 48,
                                ),
                                color: feature['color'] as Color,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                feature['title'] as String,
                                style: TextStyle(
                                  fontSize:
                                      ResponsiveHelper.getResponsiveFontSize(
                                        context,
                                        mobile: 14,
                                        tablet: 16,
                                        desktop: 18,
                                      ),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
