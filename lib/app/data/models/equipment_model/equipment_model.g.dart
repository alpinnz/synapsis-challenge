// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentModel _$EquipmentModelFromJson(Map<String, dynamic> json) =>
    EquipmentModel(
      id: json['id'] as String,
      nearonSn: json['nearon_sn'] as String,
      headUnitSn: json['head_unit_sn'] as String,
      deviceId: json['device_id'] as String,
      serialNumber: json['serial_number'] as String,
      code: json['code'] as String,
      hm: (json['hm'] as num).toInt(),
      km: (json['km'] as num).toInt(),
      engineNo: json['engine_no'] as String,
      engineModel: json['engine_model'] as String,
      purchasedDate: DateTime.parse(json['purchased_date'] as String),
      purchasedStatus: json['purchased_status'] as String,
      conditionStatus: json['condition_status'] as String,
      outlineColor: json['outline_color'] as String,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EquipmentModelToJson(EquipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nearon_sn': instance.nearonSn,
      'head_unit_sn': instance.headUnitSn,
      'device_id': instance.deviceId,
      'serial_number': instance.serialNumber,
      'code': instance.code,
      'hm': instance.hm,
      'km': instance.km,
      'engine_no': instance.engineNo,
      'engine_model': instance.engineModel,
      'purchased_date': instance.purchasedDate.toIso8601String(),
      'purchased_status': instance.purchasedStatus,
      'condition_status': instance.conditionStatus,
      'outline_color': instance.outlineColor,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
