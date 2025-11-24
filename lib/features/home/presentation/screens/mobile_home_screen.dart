import 'package:flutter/material.dart';
import 'package:gpt_model/core/navigation/responsive_navigation.dart';

import '../../../../core/common_widgets/singleclic_logo.dart';
import '../../../medical/presentation/screens/health_tips_screen.dart';
import '../../../medical/presentation/screens/emergency_screen.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const SingleClicLogo(width: 100),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'المساعد الطبي الذكي',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'صحتك في أيد أمينة',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Features Cards
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.2,
                    children: [
                      _buildFeatureCard(
                        context,
                        'محادثة طبية',
                        Icons.chat_bubble_outline,
                        'اسأل عن أي أعراض أو مشاكل صحية',
                        () {
                          Navigator.pushNamed(context, Routes.chat);
                        },
                      ),
                      _buildFeatureCard(
                        context,
                        'تحليل الأشعة',
                        Icons.photo_camera,
                        'ارفع صورة أشعة للحصول على تحليل',
                        () => _navigateToImageAnalysis(context),
                      ),
                      _buildFeatureCard(
                        context,
                        'النصائح الصحية',
                        Icons.favorite,
                        'احصل على نصائح صحية يومية',
                        () => _navigateToHealthTips(context),
                      ),
                      _buildFeatureCard(
                        context,
                        'الطوارئ',
                        Icons.emergency,
                        'حالات الطوارئ والإسعافات الأولية',
                        () => _navigateToEmergency(context),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Quick Actions
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'ابدأ محادثة طبية الآن',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.chat);
                          },
                          icon: const Icon(Icons.chat),
                          label: const Text('ابدأ المحادثة'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF2E7D32),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    IconData icon,
    String description,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFF2E7D32)),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // void _navigateToChat(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const ResponsiveChatPage()),
  //   );
  // }

  void _navigateToImageAnalysis(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ميزة تحليل الصور قيد التطوير')),
    );
  }

  void _navigateToHealthTips(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HealthTipsScreen()),
    );
  }

  void _navigateToEmergency(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmergencyScreen()),
    );
  }
}
