import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserModel extends Equatable {
  final String id;
  final int roleId;
  final String roleName;
  final bool isDefaultRole;
  final String departmentId;
  final String departmentName;
  final String siteId;
  final String siteName;
  final dynamic fleetId;
  final String nik;
  final String name;
  final String email;
  final String phone;
  final bool isActive;
  final String imageUrl;
  final String unitId;
  final String unitCode;
  final String unitTypeId;
  final int loginType;
  final int loginStatus;
  final DateTime loginAt;
  final int lastTotalCycle;
  final int lastTotalHauler;
  final String lastCycleId;
  final String lastActivityId;
  final dynamic lastPit;
  final dynamic lastHauler;
  final dynamic lastLoader;
  final dynamic lastLoadingPoint;
  final dynamic lastDumpingPoint;
  final dynamic lastMaterial;
  final bool cycleFinished;
  final bool isDisposal;

  const UserModel({
    required this.id,
    required this.roleId,
    required this.roleName,
    required this.isDefaultRole,
    required this.departmentId,
    required this.departmentName,
    required this.siteId,
    required this.siteName,
    required this.fleetId,
    required this.nik,
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.imageUrl,
    required this.unitId,
    required this.unitCode,
    required this.unitTypeId,
    required this.loginType,
    required this.loginStatus,
    required this.loginAt,
    required this.lastTotalCycle,
    required this.lastTotalHauler,
    required this.lastCycleId,
    required this.lastActivityId,
    required this.lastPit,
    required this.lastHauler,
    required this.lastLoader,
    required this.lastLoadingPoint,
    required this.lastDumpingPoint,
    required this.lastMaterial,
    required this.cycleFinished,
    required this.isDisposal,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() {
    return User(
      id: id,
      roleId: roleId,
      roleName: roleName,
      isDefaultRole: isDefaultRole,
      departmentId: departmentId,
      departmentName: departmentName,
      siteId: siteId,
      siteName: siteName,
      fleetId: fleetId,
      nik: nik,
      name: name,
      email: email,
      phone: phone,
      isActive: isActive,
      imageUrl: imageUrl,
      unitId: unitId,
      unitCode: unitCode,
      unitTypeId: unitTypeId,
      loginType: loginType,
      loginStatus: loginStatus,
      loginAt: loginAt,
      lastTotalCycle: lastTotalCycle,
      lastTotalHauler: lastTotalHauler,
      lastCycleId: lastCycleId,
      lastActivityId: lastActivityId,
      lastPit: lastPit,
      lastHauler: lastHauler,
      lastLoader: lastLoader,
      lastLoadingPoint: lastLoader,
      lastDumpingPoint: lastDumpingPoint,
      lastMaterial: lastMaterial,
      cycleFinished: cycleFinished,
      isDisposal: isDisposal,
    );
  }

  @override
  List<Object?> get props => [id];
}
