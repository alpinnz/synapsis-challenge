// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageTemplateModel _$MessageTemplateModelFromJson(
        Map<String, dynamic> json) =>
    MessageTemplateModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: (json['code'] as num).toInt(),
      categoryId: json['category_id'] as String,
      sendingType: (json['sending_type'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      defaultMessage: json['default_message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      categoryName: json['category_name'] as String,
    );

Map<String, dynamic> _$MessageTemplateModelToJson(
        MessageTemplateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'category_id': instance.categoryId,
      'sending_type': instance.sendingType,
      'default_message': instance.defaultMessage,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'category_name': instance.categoryName,
    };
