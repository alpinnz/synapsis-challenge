import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';

part 'device_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DeviceModel extends Device {
  DeviceModel({
    required super.id,
    required super.isActive,
    required super.activatedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.headUnitSn,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}