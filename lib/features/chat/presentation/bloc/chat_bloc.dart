import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/send_message.dart';
import '../../domain/usecases/get_chat_history.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage sendMessage;
  final GetChatHistory getChatHistory;

  ChatBloc({required this.sendMessage, required this.getChatHistory})
    : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<LoadChatHistoryEvent>(_onLoadChatHistory);
    on<ClearChatEvent>(_onClearChat);
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading());

    final result = await sendMessage(event.message);

    result.fold((failure) => emit(ChatError(failure.message)), (response) {
      // Create user message
      final userMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: event.message,
        isUser: true,
        timestamp: DateTime.now(),
      );

      // Create AI response message
      final aiMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString() + '_ai',
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
        type: MessageType.medicalAnalysis,
      );

      emit(ChatLoaded(messages: [userMessage, aiMessage]));
    });
  }

  Future<void> _onLoadChatHistory(
    LoadChatHistoryEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading());

    final result = await getChatHistory();

    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (messages) => emit(ChatLoaded(messages: messages)),
    );
  }

  Future<void> _onClearChat(
    ClearChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatInitial());
  }
}
