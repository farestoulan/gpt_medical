import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/chat_repository.dart';

class SendMessage {
  final ChatRepository repository;

  SendMessage({required this.repository});

  Future<Either<Failure, String>> call(String message) async {
    if (message.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'الرسالة لا يمكن أن تكون فارغة'),
      );
    }

    if (message.length > 1000) {
      return const Left(ValidationFailure(message: 'الرسالة طويلة جداً'));
    }

    return await repository.sendMessage(message);
  }
}
