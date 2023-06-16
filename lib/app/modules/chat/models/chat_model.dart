class ChatModel {
  final String name;
  final DateTime updateAt;
  final String description;
  final String imageUrl;

  const ChatModel({
    required this.name,
    required this.updateAt,
    required this.description,
    required this.imageUrl,
  });
}
