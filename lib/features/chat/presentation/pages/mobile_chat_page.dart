import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../../../../core/common_widgets/widgets/adaptive_layout.dart';
import '../widgets/message_bubble.dart';

class MobileChatPage extends StatefulWidget {
  const MobileChatPage({super.key});

  @override
  State<MobileChatPage> createState() => _MobileChatPageState();
}

class _MobileChatPageState extends State<MobileChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    // Dispatch event to bloc
    context.read<ChatBloc>().add(SendMessageEvent(message: text));
    // Clear input and unfocus keyboard
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdaptiveAppBar(
        title: 'المساعد الطبي الذكي',
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: null, // Will be handled by parent
            tooltip: 'محادثة جديدة',
          ),
        ],
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Column(
            children: [
              // Messages List - Mobile optimized
              Expanded(
                child:
                    state is ChatLoaded && state.messages.isNotEmpty
                        ? ListView.builder(
                          padding: const EdgeInsets.all(16),
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
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'مرحباً! كيف يمكنني مساعدتك اليوم؟',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
              ),

              // Loading indicator
              if (state is ChatLoading)
                Container(
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 12),
                      Text('المساعد الطبي يفكر...'),
                    ],
                  ),
                ),

              // Error indicator
              if (state is ChatError)
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Input Section - Mobile optimized
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border(top: BorderSide(color: Colors.grey[300]!)),
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
                    ),

                    // Text input
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'اكتب رسالتك هنا...',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        maxLines: null,
                        textDirection: TextDirection.rtl,
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Send button
                    FloatingActionButton.small(
                      onPressed: () {
                        _sendMessage();
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
    );
  }
}
