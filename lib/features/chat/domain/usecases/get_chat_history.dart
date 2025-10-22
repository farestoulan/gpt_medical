import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class GetChatHistory {
  final ChatRepository repository;

  GetChatHistory({required this.repository});

  Future<Either<Failure, List<ChatMessage>>> call() async {
    return await repository.getChatHistory();
  }
}
