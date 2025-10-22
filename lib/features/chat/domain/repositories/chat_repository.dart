import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<Either<Failure, String>> sendMessage(String message);
  Future<Either<Failure, List<ChatMessage>>> getChatHistory();
  Future<Either<Failure, void>> saveMessage(ChatMessage message);
  Future<Either<Failure, void>> clearChatHistory();
  Future<Either<Failure, List<ChatMessage>>> searchMessages(String query);
}
