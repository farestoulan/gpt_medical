import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../../../../core/common_widgets/widgets/adaptive_layout.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../widgets/message_bubble.dart';

class TabletChatPage extends StatelessWidget {
  const TabletChatPage({super.key});

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
        ],
      ),
      body: Row(
        children: [
          // Sidebar for tablet
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(right: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Column(
              children: [
                // Quick actions
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الإجراءات السريعة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildQuickActionButton(
                        context,
                        'محادثة جديدة',
                        Icons.chat,
                        () {
                          context.read<ChatBloc>().add(const ClearChatEvent());
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildQuickActionButton(
                        context,
                        'تحليل صورة',
                        Icons.camera_alt,
                        () {
                          // TODO: Implement image analysis
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildQuickActionButton(
                        context,
                        'النصائح الصحية',
                        Icons.favorite,
                        () {
                          // TODO: Navigate to health tips
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // Chat history
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Text(
                        'المحادثات السابقة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // TODO: Add chat history items
                      const Text(
                        'لا توجد محادثات سابقة',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main chat area
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // Messages List
                    Expanded(
                      child:
                          state is ChatLoaded && state.messages.isNotEmpty
                              ? ListView.builder(
                                padding: const EdgeInsets.all(24),
                                itemCount: state.messages.length,
                                itemBuilder: (context, index) {
                                  final message = state.messages[index];
                                  return MessageBubble(message: message);
                                },
                              )
                              : const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.medical_services,
                                      size: 80,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 24),
                                    Text(
                                      'مرحباً! كيف يمكنني مساعدتك اليوم؟',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'يمكنك البدء بكتابة سؤالك أو رفع صورة طبية للتحليل',
                                      style: TextStyle(
                                        fontSize: 16,
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
                        padding: const EdgeInsets.all(24),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'المساعد الطبي يفكر...',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                    // Error indicator
                    if (state is ChatError)
                      Container(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // Input Section
                    Container(
                      padding: const EdgeInsets.all(24),
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
                            iconSize: 28,
                          ),

                          // Text input
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'اكتب رسالتك هنا...',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                              maxLines: null,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(fontSize: 16),
                              onSubmitted: (value) {
                                if (value.trim().isNotEmpty) {
                                  context.read<ChatBloc>().add(
                                    SendMessageEvent(message: value),
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Send button
                          FloatingActionButton(
                            onPressed: () {
                              // TODO: Implement send message
                            },
                            backgroundColor: const Color(0xFF2E7D32),
                            child: const Icon(Icons.send, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(
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
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
