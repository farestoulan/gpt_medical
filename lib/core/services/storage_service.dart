import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/chat/data/models/chat_message.dart';

class StorageService {
  static const String _chatMessagesKey = 'chat_messages';
  static const String _userPreferencesKey = 'user_preferences';
  static const String _medicalHistoryKey = 'medical_history';
  static const String _favoriteTipsKey = 'favorite_tips';

  // حفظ رسائل المحادثة
  static Future<void> saveChatMessages(List<ChatMessage> messages) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesJson = messages.map((msg) => msg.toJson()).toList();
      await prefs.setString(_chatMessagesKey, jsonEncode(messagesJson));
    } catch (e) {
      print('خطأ في حفظ رسائل المحادثة: $e');
    }
  }

  // تحميل رسائل المحادثة
  static Future<List<ChatMessage>> loadChatMessages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesJson = prefs.getString(_chatMessagesKey);

      if (messagesJson != null) {
        final List<dynamic> messagesList = jsonDecode(messagesJson);
        return messagesList.map((msg) => ChatMessage.fromJson(msg)).toList();
      }
    } catch (e) {
      print('خطأ في تحميل رسائل المحادثة: $e');
    }
    return [];
  }

  // مسح رسائل المحادثة
  static Future<void> clearChatMessages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_chatMessagesKey);
    } catch (e) {
      print('خطأ في مسح رسائل المحادثة: $e');
    }
  }

  // حفظ تفضيلات المستخدم
  static Future<void> saveUserPreferences(
    Map<String, dynamic> preferences,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userPreferencesKey, jsonEncode(preferences));
    } catch (e) {
      print('خطأ في حفظ تفضيلات المستخدم: $e');
    }
  }

  // تحميل تفضيلات المستخدم
  static Future<Map<String, dynamic>> loadUserPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final preferencesJson = prefs.getString(_userPreferencesKey);

      if (preferencesJson != null) {
        return Map<String, dynamic>.from(jsonDecode(preferencesJson));
      }
    } catch (e) {
      print('خطأ في تحميل تفضيلات المستخدم: $e');
    }
    return {};
  }

  // حفظ التاريخ الطبي
  static Future<void> saveMedicalHistory(Map<String, dynamic> history) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_medicalHistoryKey, jsonEncode(history));
    } catch (e) {
      print('خطأ في حفظ التاريخ الطبي: $e');
    }
  }

  // تحميل التاريخ الطبي
  static Future<Map<String, dynamic>> loadMedicalHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString(_medicalHistoryKey);

      if (historyJson != null) {
        return Map<String, dynamic>.from(jsonDecode(historyJson));
      }
    } catch (e) {
      print('خطأ في تحميل التاريخ الطبي: $e');
    }
    return {};
  }

  // حفظ النصائح المفضلة
  static Future<void> saveFavoriteTips(List<String> tips) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_favoriteTipsKey, tips);
    } catch (e) {
      print('خطأ في حفظ النصائح المفضلة: $e');
    }
  }

  // تحميل النصائح المفضلة
  static Future<List<String>> loadFavoriteTips() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(_favoriteTipsKey) ?? [];
    } catch (e) {
      print('خطأ في تحميل النصائح المفضلة: $e');
      return [];
    }
  }

  // إضافة نصيحة للمفضلة
  static Future<void> addFavoriteTip(String tip) async {
    try {
      final favoriteTips = await loadFavoriteTips();
      if (!favoriteTips.contains(tip)) {
        favoriteTips.add(tip);
        await saveFavoriteTips(favoriteTips);
      }
    } catch (e) {
      print('خطأ في إضافة النصيحة للمفضلة: $e');
    }
  }

  // إزالة نصيحة من المفضلة
  static Future<void> removeFavoriteTip(String tip) async {
    try {
      final favoriteTips = await loadFavoriteTips();
      favoriteTips.remove(tip);
      await saveFavoriteTips(favoriteTips);
    } catch (e) {
      print('خطأ في إزالة النصيحة من المفضلة: $e');
    }
  }

  // مسح جميع البيانات
  static Future<void> clearAllData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      print('خطأ في مسح جميع البيانات: $e');
    }
  }

  // الحصول على حجم البيانات المحفوظة
  static Future<int> getStorageSize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys = prefs.getKeys();
      int totalSize = 0;

      for (String key in keys) {
        final value = prefs.getString(key);
        if (value != null) {
          totalSize += value.length;
        }
      }

      return totalSize;
    } catch (e) {
      print('خطأ في حساب حجم البيانات: $e');
      return 0;
    }
  }

  // تصدير البيانات
  static Future<Map<String, dynamic>> exportData() async {
    try {
      final chatMessages = await loadChatMessages();
      final userPreferences = await loadUserPreferences();
      final medicalHistory = await loadMedicalHistory();
      final favoriteTips = await loadFavoriteTips();

      return {
        'chatMessages': chatMessages.map((msg) => msg.toJson()).toList(),
        'userPreferences': userPreferences,
        'medicalHistory': medicalHistory,
        'favoriteTips': favoriteTips,
        'exportDate': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      print('خطأ في تصدير البيانات: $e');
      return {};
    }
  }

  // استيراد البيانات
  static Future<void> importData(Map<String, dynamic> data) async {
    try {
      if (data.containsKey('chatMessages')) {
        final messagesList = data['chatMessages'] as List;
        final messages =
            messagesList.map((msg) => ChatMessage.fromJson(msg)).toList();
        await saveChatMessages(messages);
      }

      if (data.containsKey('userPreferences')) {
        await saveUserPreferences(
          Map<String, dynamic>.from(data['userPreferences']),
        );
      }

      if (data.containsKey('medicalHistory')) {
        await saveMedicalHistory(
          Map<String, dynamic>.from(data['medicalHistory']),
        );
      }

      if (data.containsKey('favoriteTips')) {
        await saveFavoriteTips(List<String>.from(data['favoriteTips']));
      }
    } catch (e) {
      print('خطأ في استيراد البيانات: $e');
    }
  }
}
