import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/domain/entities/equipment/equipment.dart';

part 'equipment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EquipmentModel extends Equipment {
  EquipmentModel({
    required super.id,
    // required super.site,
    // required super.model,
    required super.nearonSn,
    required super.headUnitSn,
    required super.deviceId,
    required super.serialNumber,
    required super.code,
    required super.hm,
    required super.km,
    required super.engineNo,
    required super.engineModel,
    required super.purchasedDate,
    required super.purchasedStatus,
    required super.conditionStatus,
    required super.outlineColor,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    // required super.telemetry,
    // required super.siteFactorMaterial,
    // required super.installedModification,
    // required super.siteFactorMaterials,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) => _$EquipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentModelToJson(this);
}
