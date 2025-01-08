import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/data/models/equipment_model/equipment_model.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';

part 'device_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeviceModel extends Equatable {
  final String id;
  final bool isActive;
  final DateTime? activatedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String headUnitSn;
  final EquipmentModel? equipment;

  const DeviceModel({
    required this.id,
    required this.isActive,
    this.activatedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.headUnitSn,
    this.equipment,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  Device toEntity() {
    return Device(
      id: id,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      headUnitSn: headUnitSn,
      equipment: equipment?.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        isActive,
        activatedAt,
        createdAt,
        updatedAt,
        headUnitSn,
        equipment,
      ];
}
