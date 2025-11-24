import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_model/core/navigation/responsive_navigation.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/chat_bloc.dart';
import '../widgets/message_bubble.dart';

/// صفحة محادثة محسّنة خصيصاً للويب/ديسكتوب
/// تتضمن animations، hover effects، وتجربة مستخدم محسّنة
class WebChatPage extends StatefulWidget {
  const WebChatPage({super.key});

  @override
  State<WebChatPage> createState() => _WebChatPageState();
}

class _WebChatPageState extends State<WebChatPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();
  late AnimationController _animationController;
  int _selectedNavIndex = 0;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();

    // Load chat history
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatBloc>().add(const LoadChatHistoryEvent());
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey[50]!, Colors.grey[100]!],
          ),
        ),
        child: Row(
          children: [
            // Left Sidebar with animation
            _buildAnimatedSidebar(),

            // Main Chat Area
            Expanded(
              child: Column(
                children: [
                  _buildModernAppBar(),
                  Expanded(child: _buildChatArea()),
                ],
              ),
            ),

            // Right Sidebar
            _buildRightSidebar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSidebar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo & User Profile
          _buildSidebarHeader(),

          const SizedBox(height: 24),

          // Navigation Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildNavItem(
                  'محادثة جديدة',
                  Icons.chat_bubble_outline_rounded,
                  0,
                  () {
                    context.read<ChatBloc>().add(const ClearChatEvent());
                    setState(() => _selectedNavIndex = 0);
                  },
                ),
                const SizedBox(height: 8),
                _buildNavItem('تحليل الصور', Icons.camera_alt_rounded, 1, () {
                  setState(() => _selectedNavIndex = 1);
                  _pickImage();
                }),
                const SizedBox(height: 8),
                _buildNavItem('النصائح الصحية', Icons.favorite_rounded, 2, () {
                  setState(() => _selectedNavIndex = 2);
                  Navigator.pushNamed(context, Routes.healthTips);
                }),
                const SizedBox(height: 8),
                _buildNavItem('الطوارئ', Icons.emergency_rounded, 3, () {
                  setState(() => _selectedNavIndex = 3);
                  Navigator.pushNamed(context, Routes.emergency);
                }),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),
                _buildNavItem(
                  'الإعدادات',
                  Icons.settings_rounded,
                  4,
                  () => setState(() => _selectedNavIndex = 4),
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  'المساعدة',
                  Icons.help_outline_rounded,
                  5,
                  () => setState(() => _selectedNavIndex = 5),
                ),
              ],
            ),
          ),

          // Version Info
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFF2E7D32),
                        size: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'متصل',
                        style: TextStyle(
                          color: Color(0xFF2E7D32),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'الإصدار 1.0.0',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.medical_services_rounded,
              color: Color(0xFF2E7D32),
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'المساعد الطبي',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Medical AI',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    String title,
    IconData icon,
    int index,
    VoidCallback onTap,
  ) {
    final isSelected = _selectedNavIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? const Color(0xFF2E7D32).withValues(alpha: 0.1)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    isSelected
                        ? const Color(0xFF2E7D32).withValues(alpha: 0.3)
                        : Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color:
                      isSelected ? const Color(0xFF2E7D32) : Colors.grey[600],
                  size: 22,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          isSelected
                              ? const Color(0xFF2E7D32)
                              : Colors.grey[700],
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E7D32),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'محادثة طبية',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const Spacer(),
          _buildAppBarButton(Icons.refresh_rounded, 'بدء محادثة جديدة', () {
            context.read<ChatBloc>().add(const ClearChatEvent());
          }),
          const SizedBox(width: 16),
          _buildAppBarButton(Icons.download_rounded, 'تنزيل المحادثة', () {
            // TODO: Implement download
          }),
          const SizedBox(width: 16),
          _buildAppBarButton(Icons.more_vert_rounded, 'المزيد', () {
            // TODO: Show more options
          }),
        ],
      ),
    );
  }

  Widget _buildAppBarButton(IconData icon, String tooltip, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.grey[700], size: 22),
          ),
        ),
      ),
    );
  }

  Widget _buildChatArea() {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatLoaded && state.messages.isNotEmpty) {
          _scrollToBottom();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            // Messages Area
            Expanded(
              child:
                  state is ChatLoaded && state.messages.isNotEmpty
                      ? ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(32),
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          return FadeTransition(
                            opacity: _animationController,
                            child: MessageBubble(message: message),
                          );
                        },
                      )
                      : _buildEmptyState(),
            ),

            // Loading Indicator
            if (state is ChatLoading) _buildLoadingIndicator(),

            // Error Indicator
            if (state is ChatError) _buildErrorIndicator(state.message),

            // Input Area
            _buildInputArea(),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.medical_services_rounded,
              size: 100,
              color: Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'مرحباً! كيف يمكنني مساعدتك اليوم؟',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'يمكنك البدء بكتابة سؤالك أو رفع صورة طبية للتحليل',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildQuickActionChip(
                'أعراض شائعة',
                Icons.sick_rounded,
                () => _sendQuickMessage('ما هي الأعراض الشائعة للإنفلونزا؟'),
              ),
              _buildQuickActionChip(
                'نصائح صحية',
                Icons.tips_and_updates_rounded,
                () => _sendQuickMessage('أعطني نصيحة صحية'),
              ),
              _buildQuickActionChip(
                'تحليل صورة',
                Icons.camera_alt_rounded,
                () => _pickImage(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionChip(
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF2E7D32), size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF2E7D32),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'المساعد الطبي يفكر...',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorIndicator(String message) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red[700]),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.red[700], fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image Picker Button
          _buildInputButton(Icons.camera_alt_rounded, 'رفع صورة', _pickImage),
          const SizedBox(width: 16),

          // Voice Input Button
          _buildInputButton(Icons.mic_rounded, 'تسجيل صوتي', () {
            // TODO: Implement voice input
          }),
          const SizedBox(width: 16),

          // Text Input
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'اكتب رسالتك هنا...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                maxLines: null,
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    _isTyping = value.trim().isNotEmpty;
                  });
                },
                onSubmitted: (value) => _sendMessage(),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Send Button
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: InkWell(
                onTap: _sendMessage,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:
                          _isTyping
                              ? [
                                const Color(0xFF2E7D32),
                                const Color(0xFF43A047),
                              ]
                              : [Colors.grey[300]!, Colors.grey[400]!],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow:
                        _isTyping
                            ? [
                              BoxShadow(
                                color: const Color(
                                  0xFF2E7D32,
                                ).withValues(alpha: 0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ]
                            : [],
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputButton(IconData icon, String tooltip, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF2E7D32), size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildRightSidebar() {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Tips Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.lightbulb_rounded, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'نصائح سريعة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTipCard(
                  'اسأل عن الأعراض',
                  'صف أعراضك بدقة للحصول على تشخيص أفضل',
                  Icons.sick_rounded,
                ),
                const SizedBox(height: 12),
                _buildTipCard(
                  'رفع صورة طبية',
                  'يمكنك رفع صور الأشعة للتحليل',
                  Icons.camera_alt_rounded,
                ),
                const SizedBox(height: 12),
                _buildTipCard(
                  'استشارة مجانية',
                  'الخدمة مجانية ومتاحة 24/7',
                  Icons.access_time_rounded,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Recent Conversations
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.history_rounded, color: Colors.grey[700]),
                      const SizedBox(width: 12),
                      Text(
                        'المحادثات الأخيرة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 64,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'لا توجد محادثات سابقة',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatBloc>().add(SendMessageEvent(message: text));
      _messageController.clear();
      setState(() {
        _isTyping = false;
      });
      _scrollToBottom();
    }
  }

  void _sendQuickMessage(String message) {
    context.read<ChatBloc>().add(SendMessageEvent(message: message));
    _scrollToBottom();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null && mounted) {
        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => AlertDialog(
                content: const Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 16),
                    Text('جاري تحليل الصورة...'),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
        );

        // Simulate image analysis (TODO: Implement actual analysis)
        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          Navigator.of(context).pop();
          // TODO: Send image for analysis
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('تم رفع الصورة بنجاح'),
              backgroundColor: const Color(0xFF2E7D32),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في رفع الصورة: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
  }
}
