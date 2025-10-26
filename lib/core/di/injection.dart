import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

import '../constants/app_constants.dart';
import '../constants/app_mode.dart';
import '../network/network_info.dart';
import '../../features/chat/data/datasources/chat_local_datasource.dart';
import '../../features/chat/data/datasources/chat_remote_datasource.dart';
import '../../features/chat/data/datasources/chat_mock_datasource.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../features/chat/domain/usecases/send_message.dart';
import '../../features/chat/domain/usecases/get_chat_history.dart';
import '../../features/chat/presentation/bloc/chat_bloc.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Connectivity());

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ChatLocalDataSource>(
    () => ChatLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Remote Data Source - يتم اختياره حسب وضع التطبيق
  if (AppMode.useStaticData) {
    // وضع البيانات الثابتة - لا يحتاج API Key
    print(
      '🔧 ${AppMode.modeIcon} تشغيل التطبيق في وضع: ${AppMode.currentMode}',
    );
    print('📝 استخدام بيانات طبية جاهزة');
    sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatMockDataSource());
  } else {
    // وضع API الحقيقي - يحتاج OpenAI API Key
    print(
      '🌐 ${AppMode.modeIcon} تشغيل التطبيق في وضع: ${AppMode.currentMode}',
    );

    // OpenAI Service
    sl.registerLazySingleton(() {
      final token = AppConstants.openAiApiKey;
      if (token.isEmpty) {
        throw Exception(
          'OpenAI API Key is not provided. Please set OPENAI_API_KEY environment variable.',
        );
      }
      return OpenAI.instance.build(token: token);
    });

    sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(openAI: sl()),
    );
  }

  // Repository
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SendMessage(repository: sl()));
  sl.registerLazySingleton(() => GetChatHistory(repository: sl()));

  // BLoC
  sl.registerLazySingleton(
    () => ChatBloc(sendMessage: sl(), getChatHistory: sl()),
  );
}
