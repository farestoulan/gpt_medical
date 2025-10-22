part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final String message;

  const SendMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadChatHistoryEvent extends ChatEvent {
  const LoadChatHistoryEvent();
}

class ClearChatEvent extends ChatEvent {
  const ClearChatEvent();
}
