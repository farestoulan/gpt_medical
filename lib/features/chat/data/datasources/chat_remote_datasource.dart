import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';

abstract class ChatRemoteDataSource {
  Future<String> sendMessage(String message);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final OpenAI openAI;

  ChatRemoteDataSourceImpl({required this.openAI});

  @override
  Future<String> sendMessage(String message) async {
    try {
      final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: [
          Map<String, String>.from({
            'role': 'system',
            'content': AppConstants.medicalSystemPrompt,
          }),
          Map<String, String>.from({'role': 'user', 'content': message}),
        ],
        maxToken: AppConstants.maxTokens,
        temperature: AppConstants.temperature,
      );

      final response = await openAI.onChatCompletion(request: request);

      if (response?.choices?.isNotEmpty == true) {
        return response!.choices!.first.message!.content ??
            'عذراً، لم أتمكن من الرد';
      } else {
        throw const ServerException(message: 'فشل في الحصول على رد من الخدمة');
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'خطأ غير متوقع: ${e.toString()}');
    }
  }
}
