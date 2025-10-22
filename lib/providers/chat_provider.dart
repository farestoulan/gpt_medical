import 'package:flutter/foundation.dart';
import '../models/chat_message.dart';
import '../services/medical_ai_service.dart';
import '../services/storage_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _currentChatId = '';

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  String get currentChatId => _currentChatId;

  // إضافة رسالة جديدة
  void addMessage(ChatMessage message) {
    _messages.add(message);
    _saveMessages();
    notifyListeners();
  }

  // إرسال رسالة طبية
  Future<void> sendMedicalMessage(String content) async {
    if (content.trim().isEmpty) return;

    // إضافة رسالة المستخدم
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
    );
    addMessage(userMessage);

    // بدء التحميل
    _isLoading = true;
    notifyListeners();

    try {
      // إرسال الرسالة للحصول على الرد
      final response = await MedicalAIService.sendMedicalMessage(content);

      // إضافة رد المساعد الطبي
      final aiMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
        type: MessageType.medicalAnalysis,
      );
      addMessage(aiMessage);
    } catch (e) {
      // إضافة رسالة خطأ
      final errorMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'عذراً، حدث خطأ في المعالجة. يرجى المحاولة مرة أخرى.',
        isUser: false,
        timestamp: DateTime.now(),
        type: MessageType.text,
      );
      addMessage(errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // تحليل صورة طبية
  Future<void> analyzeMedicalImage(String imagePath) async {
    _isLoading = true;
    notifyListeners();

    try {
      final analysis = await MedicalAIService.analyzeMedicalImage(imagePath);

      // إضافة رسالة تحليل الصورة
      final imageMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'تم تحليل الصورة الطبية',
        isUser: false,
        timestamp: DateTime.now(),
        type: MessageType.medicalAnalysis,
        imagePath: imagePath,
        analysisResult: analysis.result,
      );
      addMessage(imageMessage);
    } catch (e) {
      final errorMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'عذراً، فشل في تحليل الصورة. يرجى المحاولة مرة أخرى.',
        isUser: false,
        timestamp: DateTime.now(),
        type: MessageType.text,
      );
      addMessage(errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // مسح المحادثة
  void clearChat() {
    _messages.clear();
    _currentChatId = DateTime.now().millisecondsSinceEpoch.toString();
    _saveMessages();
    notifyListeners();
  }

  // بدء محادثة جديدة
  void startNewChat() {
    clearChat();

    // إضافة رسالة ترحيب
    final welcomeMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: '''مرحباً! أنا مساعدك الطبي الذكي. يمكنني مساعدتك في:
      
• الإجابة على الأسئلة الطبية العامة
• تحليل الصور الطبية والأشعة
• تقديم النصائح الصحية
• شرح الأعراض والأمراض

تذكر دائماً أن استشارة الطبيب ضرورية للتشخيص الدقيق.

كيف يمكنني مساعدتك اليوم؟''',
      isUser: false,
      timestamp: DateTime.now(),
      type: MessageType.text,
    );
    addMessage(welcomeMessage);
  }

  // البحث في المحادثات
  List<ChatMessage> searchMessages(String query) {
    return _messages
        .where(
          (message) =>
              message.content.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  // تحميل الرسائل المحفوظة
  Future<void> loadMessages() async {
    try {
      final savedMessages = await StorageService.loadChatMessages();
      _messages = savedMessages;
      notifyListeners();
    } catch (e) {
      print('خطأ في تحميل الرسائل: $e');
    }
  }

  // حفظ الرسائل
  Future<void> _saveMessages() async {
    try {
      await StorageService.saveChatMessages(_messages);
    } catch (e) {
      print('خطأ في حفظ الرسائل: $e');
    }
  }

  // تصدير المحادثة
  Future<Map<String, dynamic>> exportChat() async {
    try {
      return await StorageService.exportData();
    } catch (e) {
      print('خطأ في تصدير المحادثة: $e');
      return {};
    }
  }

  // استيراد المحادثة
  Future<void> importChat(Map<String, dynamic> data) async {
    try {
      await StorageService.importData(data);
      await loadMessages();
    } catch (e) {
      print('خطأ في استيراد المحادثة: $e');
    }
  }
}
