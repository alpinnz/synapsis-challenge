class MessageTemplate {
  String id;
  String name;
  int code;
  String categoryId;
  List<String> sendingType;
  String defaultMessage;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryName;

  MessageTemplate({
    required this.id,
    required this.name,
    required this.code,
    required this.categoryId,
    required this.sendingType,
    required this.defaultMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
  });
}
