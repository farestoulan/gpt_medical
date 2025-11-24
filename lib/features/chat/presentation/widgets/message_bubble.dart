import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../domain/entities/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF2E7D32),
              child: const Icon(
                Icons.medical_services,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
          ],

          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    message.isUser ? const Color(0xFF2E7D32) : Colors.grey[200],
                borderRadius: BorderRadius.circular(16).copyWith(
                  bottomLeft:
                      message.isUser
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                  bottomRight:
                      message.isUser
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Message content
                  if (message.type == MessageType.text ||
                      message.type == MessageType.medicalAnalysis)
                    MarkdownBody(
                      data: message.content,
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black87,
                          fontSize: 16,
                        ),
                        strong: TextStyle(
                          color:
                              message.isUser
                                  ? Colors.white
                                  : const Color(0xFF2E7D32),
                          fontWeight: FontWeight.bold,
                        ),
                        em: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black87,
                          fontStyle: FontStyle.italic,
                        ),
                        listBullet: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black87,
                        ),
                      ),
                    )
                  else
                    Text(
                      message.content,
                      style: TextStyle(
                        color: message.isUser ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),

                  // Image if present
                  if (message.imagePath != null) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(message.imagePath!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ],

                  // Analysis result if present
                  if (message.analysisResult != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            message.isUser
                                ? Colors.white.withValues(alpha: 0.2)
                                : const Color(
                                  0xFF2E7D32,
                                ).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.analytics,
                                size: 16,
                                color:
                                    message.isUser
                                        ? Colors.white
                                        : const Color(0xFF2E7D32),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'نتيجة التحليل:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      message.isUser
                                          ? Colors.white
                                          : const Color(0xFF2E7D32),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message.analysisResult!,
                            style: TextStyle(
                              color:
                                  message.isUser
                                      ? Colors.white
                                      : Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Timestamp
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      color: message.isUser ? Colors.white70 : Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (message.isUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white, size: 16),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'الآن';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} دقيقة';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} ساعة';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }
}
