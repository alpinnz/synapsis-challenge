import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';

part 'message_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MessageModel {
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

  MessageModel({
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

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  Message toEntity() {
    return Message(
      id: id,
      equipmentId: equipmentId,
      senderNik: senderNik,
      isRead: isRead,
      message: message,
      createdAt: createdAt,
      updatedAt: updatedAt,
      senderName: senderName,
      deviceType: deviceType,
      categoryId: categoryId,
      equipmentCode: equipmentCode,
      equipmentSiteId: equipmentSiteId,
      categoryName: categoryName,
    );
  }
}
