import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/chat_message.dart';

abstract class ChatLocalDataSource {
  Future<List<ChatMessage>> getChatHistory();
  Future<void> saveMessage(ChatMessage message);
  Future<void> clearChatHistory();
  Future<List<ChatMessage>> searchMessages(String query);
}

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _chatMessagesKey = 'chat_messages';

  ChatLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ChatMessage>> getChatHistory() async {
    try {
      final messagesJson = sharedPreferences.getString(_chatMessagesKey);
      if (messagesJson != null) {
        final List<dynamic> messagesList = jsonDecode(messagesJson);
        return messagesList.map((msg) => ChatMessage.fromJson(msg)).toList();
      }
      return [];
    } catch (e) {
      throw CacheException(
        message: 'فشل في تحميل تاريخ المحادثة: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> saveMessage(ChatMessage message) async {
    try {
      final currentMessages = await getChatHistory();
      currentMessages.add(message);
      final messagesJson = currentMessages.map((msg) => msg.toJson()).toList();
      await sharedPreferences.setString(
        _chatMessagesKey,
        jsonEncode(messagesJson),
      );
    } catch (e) {
      throw CacheException(message: 'فشل في حفظ الرسالة: ${e.toString()}');
    }
  }

  @override
  Future<void> clearChatHistory() async {
    try {
      await sharedPreferences.remove(_chatMessagesKey);
    } catch (e) {
      throw CacheException(
        message: 'فشل في مسح تاريخ المحادثة: ${e.toString()}',
      );
    }
  }

  @override
  Future<List<ChatMessage>> searchMessages(String query) async {
    try {
      final messages = await getChatHistory();
      return messages
          .where(
            (message) =>
                message.content.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } catch (e) {
      throw CacheException(
        message: 'فشل في البحث في المحادثات: ${e.toString()}',
      );
    }
  }
}
