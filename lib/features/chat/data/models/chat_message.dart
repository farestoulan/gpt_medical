class ChatMessage {
  final String id;
  final String content;
  final bool isUser;
  final DateTime timestamp;
  final MessageType type;
  final String? imagePath;
  final String? analysisResult;

  ChatMessage({
    required this.id,
    required this.content,
    required this.isUser,
    required this.timestamp,
    this.type = MessageType.text,
    this.imagePath,
    this.analysisResult,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'type': type.toString(),
      'imagePath': imagePath,
      'analysisResult': analysisResult,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      content: json['content'],
      isUser: json['isUser'],
      timestamp: DateTime.parse(json['timestamp']),
      type: MessageType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => MessageType.text,
      ),
      imagePath: json['imagePath'],
      analysisResult: json['analysisResult'],
    );
  }
}

enum MessageType { text, image, medicalAnalysis, prescription, emergency }
