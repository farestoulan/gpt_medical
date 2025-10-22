import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_local_datasource.dart';
import '../datasources/chat_remote_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final ChatLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ChatRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> sendMessage(String message) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.sendMessage(message);
        return Right(response);
      } else {
        return const Left(NetworkFailure(message: 'لا يوجد اتصال بالإنترنت'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessage>>> getChatHistory() async {
    try {
      final messages = await localDataSource.getChatHistory();
      return Right(messages);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> saveMessage(ChatMessage message) async {
    try {
      await localDataSource.saveMessage(message);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearChatHistory() async {
    try {
      await localDataSource.clearChatHistory();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessage>>> searchMessages(
    String query,
  ) async {
    try {
      final messages = await localDataSource.searchMessages(query);
      return Right(messages);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnknownFailure(message: 'خطأ غير متوقع: ${e.toString()}'));
    }
  }
}
