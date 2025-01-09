import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/domain/entities/message_template/message_template.dart';

part 'message_template_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MessageTemplateModel extends Equatable {
  String id;
  String name;
  int code;
  String categoryId;
  List<String> sendingType;
  String defaultMessage;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryName;

  MessageTemplateModel({
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

  factory MessageTemplateModel.fromJson(Map<String, dynamic> json) => _$MessageTemplateModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageTemplateModelToJson(this);

  MessageTemplate toEntity() {
    return MessageTemplate(
      id: id,
      name: name,
      code: code,
      categoryId: categoryId,
      sendingType: sendingType,
      defaultMessage: defaultMessage,
      createdAt: createdAt,
      updatedAt: updatedAt,
      categoryName: categoryName,
    );
  }

  @override
  List<Object?> get props => [id];
}
