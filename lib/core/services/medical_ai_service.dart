import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../features/chat/data/models/medical_condition.dart';
import '../../features/medical/data/datasources/medical_knowledge.dart';

class MedicalAIService {
  static const String _baseUrl = 'https://api.openai.com/v1';
  static const String _apiKey =
      'YOUR_OPENAI_API_KEY'; // يجب استبدالها بمفتاح API الحقيقي

  // إرسال رسالة نصية للحصول على استجابة طبية
  static Future<String> sendMedicalMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-4',
          'messages': [
            {
              'role': 'system',
              'content':
                  '''أنت مساعد طبي ذكي متخصص في تقديم النصائح الطبية العامة. 
              يجب أن تذكر دائماً أن استشارة الطبيب ضرورية للتشخيص الدقيق.
              قدم معلومات طبية دقيقة ومفيدة باللغة العربية.
              إذا كان السؤال يتعلق بحالة طوارئ، نصح بالذهاب إلى المستشفى فوراً.''',
            },
            {'role': 'user', 'content': message},
          ],
          'max_tokens': 1000,
          'temperature': 0.3,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return 'عذراً، حدث خطأ في الاتصال. يرجى المحاولة مرة أخرى.';
      }
    } catch (e) {
      return 'عذراً، حدث خطأ في الاتصال. يرجى المحاولة مرة أخرى.';
    }
  }

  // تحليل الصور الطبية
  static Future<MedicalImageAnalysis> analyzeMedicalImage(
    String imagePath,
  ) async {
    try {
      // محاكاة تحليل الصورة (في التطبيق الحقيقي، ستستخدم Google Cloud Vision أو خدمة مشابهة)
      await Future.delayed(Duration(seconds: 2)); // محاكاة وقت المعالجة

      return MedicalImageAnalysis(
        imagePath: imagePath,
        analysisType: 'X-Ray Analysis',
        result: 'تم تحليل الصورة بنجاح',
        confidence: 0.85,
        findings: [
          'لا توجد كسور واضحة',
          'الأنسجة الرخوة تبدو طبيعية',
          'يُنصح بمراجعة طبيب مختص للتأكد',
        ],
        recommendation: 'يُنصح بمراجعة طبيب الأشعة للتأكد من النتائج',
        analyzedAt: DateTime.now(),
      );
    } catch (e) {
      throw Exception('فشل في تحليل الصورة: $e');
    }
  }

  // البحث عن حالة طبية
  static Future<List<MedicalCondition>> searchMedicalConditions(
    String query,
  ) async {
    // محاكاة وقت البحث
    await Future.delayed(Duration(milliseconds: 500));

    // البحث في قاعدة المعرفة الطبية
    return MedicalKnowledge.searchConditions(query);
  }

  // الحصول على نصائح طبية عامة
  static Future<String> getGeneralMedicalAdvice() async {
    final advice = MedicalKnowledge.getGeneralHealthTips();
    return advice.join('\n• ');
  }
}
