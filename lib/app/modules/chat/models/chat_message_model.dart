class ChatMessageModel {
  final String name;
  final DateTime updateAt;
  final String description;
  final String imageUrl;

  const ChatMessageModel({
    required this.name,
    required this.updateAt,
    required this.description,
    required this.imageUrl,
  });
}
