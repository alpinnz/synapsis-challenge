import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/domain/entities/equipment/equipment.dart';

part 'equipment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EquipmentModel extends Equatable {
  final String id;

  // dynamic site;
  // dynamic model;
  final String nearonSn;
  final String headUnitSn;
  final String deviceId;
  final String serialNumber;
  final String code;
  final int hm;
  final int km;
  final String engineNo;
  final String engineModel;
  final DateTime purchasedDate;
  final String purchasedStatus;
  final String conditionStatus;
  final String outlineColor;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  // dynamic telemetry;
  // dynamic siteFactorMaterial;
  // dynamic installedModification;
  // dynamic siteFactorMaterials;
  const EquipmentModel({
    required this.id,
    // required this.site,
    // required this.model,
    required this.nearonSn,
    required this.headUnitSn,
    required this.deviceId,
    required this.serialNumber,
    required this.code,
    required this.hm,
    required this.km,
    required this.engineNo,
    required this.engineModel,
    required this.purchasedDate,
    required this.purchasedStatus,
    required this.conditionStatus,
    required this.outlineColor,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    // required this.telemetry,
    // required this.siteFactorMaterial,
    // required this.installedModification,
    // required this.siteFactorMaterials,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) => _$EquipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentModelToJson(this);

  Equipment toEntity() {
    return Equipment(
      id: id,
      nearonSn: nearonSn,
      headUnitSn: headUnitSn,
      deviceId: deviceId,
      serialNumber: serialNumber,
      code: code,
      hm: hm,
      km: km,
      engineNo: engineNo,
      engineModel: engineModel,
      purchasedDate: purchasedDate,
      purchasedStatus: purchasedStatus,
      conditionStatus: conditionStatus,
      outlineColor: outlineColor,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  List<Object?> get props => [id];
}
