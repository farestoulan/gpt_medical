import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../../../../core/widgets/adaptive_layout.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../widgets/message_bubble.dart';

class DesktopChatPage extends StatelessWidget {
  const DesktopChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdaptiveAppBar(
        title: 'المساعد الطبي الذكي',
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: null,
            tooltip: 'محادثة جديدة',
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: null,
            tooltip: 'الإعدادات',
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(right: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Column(
              children: [
                // User profile section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(color: Color(0xFF2E7D32)),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Color(0xFF2E7D32),
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'المستخدم',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Navigation menu
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildNavItem(
                        context,
                        'محادثة جديدة',
                        Icons.chat_bubble_outline,
                        true,
                        () {
                          context.read<ChatBloc>().add(const ClearChatEvent());
                        },
                      ),
                      _buildNavItem(
                        context,
                        'تحليل الصور',
                        Icons.camera_alt,
                        false,
                        () {
                          // TODO: Implement image analysis
                        },
                      ),
                      _buildNavItem(
                        context,
                        'النصائح الصحية',
                        Icons.favorite,
                        false,
                        () {
                          // TODO: Navigate to health tips
                        },
                      ),
                      _buildNavItem(
                        context,
                        'الطوارئ',
                        Icons.emergency,
                        false,
                        () {
                          // TODO: Navigate to emergency
                        },
                      ),
                      const Divider(),
                      _buildNavItem(
                        context,
                        'الإعدادات',
                        Icons.settings,
                        false,
                        () {
                          // TODO: Navigate to settings
                        },
                      ),
                      _buildNavItem(context, 'المساعدة', Icons.help, false, () {
                        // TODO: Navigate to help
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main content area
          Expanded(
            child: Row(
              children: [
                // Chat area
                Expanded(
                  flex: 2,
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          // Messages List
                          Expanded(
                            child:
                                state is ChatLoaded && state.messages.isNotEmpty
                                    ? ListView.builder(
                                      padding: const EdgeInsets.all(32),
                                      itemCount: state.messages.length,
                                      itemBuilder: (context, index) {
                                        final message = state.messages[index];
                                        return MessageBubble(message: message);
                                      },
                                    )
                                    : const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.medical_services,
                                            size: 100,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(height: 32),
                                          Text(
                                            'مرحباً! كيف يمكنني مساعدتك اليوم؟',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            'يمكنك البدء بكتابة سؤالك أو رفع صورة طبية للتحليل',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                          ),

                          // Loading indicator
                          if (state is ChatLoading)
                            Container(
                              padding: const EdgeInsets.all(32),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'المساعد الطبي يفكر...',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),

                          // Error indicator
                          if (state is ChatError)
                            Container(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                state.message,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                          // Input Section
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border(
                                top: BorderSide(color: Colors.grey[300]!),
                              ),
                            ),
                            child: Row(
                              children: [
                                // Image picker button
                                IconButton(
                                  onPressed: () {
                                    // TODO: Implement image picker
                                  },
                                  icon: const Icon(Icons.camera_alt),
                                  tooltip: 'رفع صورة',
                                  iconSize: 32,
                                ),

                                // Text input
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'اكتب رسالتك هنا...',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 20,
                                      ),
                                    ),
                                    maxLines: null,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(fontSize: 18),
                                    onSubmitted: (value) {
                                      if (value.trim().isNotEmpty) {
                                        context.read<ChatBloc>().add(
                                          SendMessageEvent(message: value),
                                        );
                                      }
                                    },
                                  ),
                                ),

                                const SizedBox(width: 20),

                                // Send button
                                FloatingActionButton(
                                  onPressed: () {
                                    // TODO: Implement send message
                                  },
                                  backgroundColor: const Color(0xFF2E7D32),
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Right sidebar for desktop
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border(left: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: Column(
                    children: [
                      // Quick tips
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'نصائح سريعة',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                            SizedBox(height: 16),
                            _buildTipItem('اسأل عن الأعراض', Icons.sick),
                            _buildTipItem('تحليل الصور', Icons.camera_alt),
                            _buildTipItem('النصائح الصحية', Icons.favorite),
                            _buildTipItem('الطوارئ', Icons.emergency),
                          ],
                        ),
                      ),
                      const Divider(),
                      // Recent conversations
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'المحادثات الأخيرة',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'لا توجد محادثات سابقة',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String title,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2E7D32).withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[600],
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buildTipItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _buildTipItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
