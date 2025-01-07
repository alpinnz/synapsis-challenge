import 'package:equatable/equatable.dart';

class Equipment extends Equatable {
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

  Equipment({
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

  @override
  List<Object?> get props => [id];
}
