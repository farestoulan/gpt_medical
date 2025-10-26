import 'package:flutter/material.dart';

/// صفحة رئيسية محسّنة خصيصاً للويب
/// تتضمن تصميم عصري وجمالي مع animations
class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1400;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1B5E20),
              const Color(0xFF2E7D32),
              const Color(0xFF43A047),
              const Color(0xFF66BB6A),
            ],
            stops: const [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern App Bar
              _buildModernAppBar(context),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreen ? 80 : 40,
                      vertical: 40,
                    ),
                    child: Column(
                      children: [
                        // Hero Section
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: _buildHeroSection(context, isLargeScreen),
                          ),
                        ),

                        const SizedBox(height: 80),

                        // Features Section
                        _buildFeaturesSection(context, isLargeScreen),

                        const SizedBox(height: 80),

                        // Statistics Section
                        _buildStatisticsSection(context, isLargeScreen),

                        const SizedBox(height: 80),

                        // Call to Action
                        _buildCallToAction(context),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo & Title
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.medical_services_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المساعد الطبي الذكي',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Medical AI Assistant',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Navigation Buttons
          _buildNavButton(context, 'الرئيسية', Icons.home, true),
          const SizedBox(width: 16),
          _buildNavButton(context, 'حول', Icons.info_outline, false),
          const SizedBox(width: 16),
          _buildNavButton(context, 'اتصل بنا', Icons.contact_support, false),
        ],
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    String label,
    IconData icon,
    bool isActive,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color:
              isActive
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isActive
                    ? Colors.white.withValues(alpha: 0.4)
                    : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isLargeScreen) {
    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 80 : 60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        children: [
          // Main Title
          Text(
            'صحتك في أيد أمينة',
            style: TextStyle(
              fontSize: isLargeScreen ? 56 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B5E20),
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'مساعد طبي ذكي يستخدم تقنيات الذكاء الاصطناعي لتقديم استشارات طبية موثوقة',
            style: TextStyle(
              fontSize: isLargeScreen ? 24 : 20,
              color: Colors.grey[700],
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          // CTA Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPrimaryButton(
                context,
                'ابدأ المحادثة الآن',
                Icons.chat_rounded,
                () {
                  Navigator.pushNamed(context, '/chat');
                },
              ),
              const SizedBox(width: 24),
              _buildSecondaryButton(
                context,
                'تعرف على المزيد',
                Icons.arrow_forward,
                () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2E7D32).withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF2E7D32), width: 2),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF2E7D32),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Icon(icon, color: const Color(0xFF2E7D32), size: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context, bool isLargeScreen) {
    final features = [
      {
        'icon': Icons.chat_bubble_rounded,
        'title': 'محادثة ذكية',
        'description': 'تحدث مع المساعد الطبي الذكي واحصل على إجابات فورية',
        'color': const Color(0xFF1976D2),
      },
      {
        'icon': Icons.camera_alt_rounded,
        'title': 'تحليل الأشعة',
        'description':
            'ارفع صورة أشعة واحصل على تحليل دقيق باستخدام الذكاء الاصطناعي',
        'color': const Color(0xFF43A047),
      },
      {
        'icon': Icons.favorite_rounded,
        'title': 'نصائح صحية',
        'description': 'احصل على نصائح صحية يومية مخصصة لك',
        'color': const Color(0xFFE53935),
      },
      {
        'icon': Icons.emergency_rounded,
        'title': 'الطوارئ',
        'description': 'دليل شامل للإسعافات الأولية وحالات الطوارئ',
        'color': const Color(0xFFFB8C00),
      },
    ];

    return Column(
      children: [
        const Text(
          'ميزات المساعد الطبي',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'كل ما تحتاجه للعناية بصحتك في مكان واحد',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(height: 60),
        Wrap(
          spacing: 32,
          runSpacing: 32,
          alignment: WrapAlignment.center,
          children:
              features.map((feature) {
                return _buildFeatureCard(
                  feature['icon'] as IconData,
                  feature['title'] as String,
                  feature['description'] as String,
                  feature['color'] as Color,
                  isLargeScreen,
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String description,
    Color color,
    bool isLargeScreen,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isLargeScreen ? 300 : 280,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, size: 48, color: color),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context, bool isLargeScreen) {
    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 80 : 60),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'موثوق به من الآلاف',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 60,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildStatItem('10K+', 'مستخدم نشط', Icons.people_rounded),
              _buildStatItem('50K+', 'استشارة طبية', Icons.chat_rounded),
              _buildStatItem('98%', 'رضا المستخدمين', Icons.star_rounded),
              _buildStatItem('24/7', 'متاح دائماً', Icons.access_time_rounded),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 48, color: Colors.white),
        const SizedBox(height: 16),
        Text(
          value,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'جاهز لتجربة المساعد الطبي الذكي؟',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'ابدأ الآن واحصل على استشارة طبية موثوقة في دقائق',
            style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildPrimaryButton(
            context,
            'ابدأ المحادثة الآن',
            Icons.rocket_launch_rounded,
            () {
              Navigator.pushNamed(context, '/chat');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.2), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2025 المساعد الطبي الذكي. جميع الحقوق محفوظة.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              _buildFooterLink('الشروط والأحكام'),
              const SizedBox(width: 24),
              _buildFooterLink('سياسة الخصوصية'),
              const SizedBox(width: 24),
              _buildFooterLink('اتصل بنا'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.8),
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
