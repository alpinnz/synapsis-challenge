import 'package:equatable/equatable.dart';

class Device extends Equatable {
  final String id;
  final bool isActive;
  final DateTime activatedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String headUnitSn;

  const Device({
    required this.id,
    required this.isActive,
    required this.activatedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.headUnitSn,
  });

  @override
  List<Object?> get props => [
        id,
        isActive,
        activatedAt,
        createdAt,
        updatedAt,
        headUnitSn,
      ];
}
