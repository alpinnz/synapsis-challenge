class Message {
  String id;
  String equipmentId;
  String senderNik;
  bool isRead;
  String message;
  DateTime createdAt;
  DateTime updatedAt;
  String senderName;
  String deviceType;
  String categoryId;
  String equipmentCode;
  String equipmentSiteId;
  String categoryName;

  Message({
    required this.id,
    required this.equipmentId,
    required this.senderNik,
    required this.isRead,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.senderName,
    required this.deviceType,
    required this.categoryId,
    required this.equipmentCode,
    required this.equipmentSiteId,
    required this.categoryName,
  });
}
