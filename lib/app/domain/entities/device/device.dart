import 'package:equatable/equatable.dart';
import 'package:synapsis/app/domain/entities/equipment/equipment.dart';

class Device extends Equatable {
  final String id;
  final bool isActive;
  final DateTime? activatedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String headUnitSn;
  final Equipment? equipment;

  const Device({
    required this.id,
    required this.isActive,
    this.activatedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.headUnitSn,
    this.equipment,
  });

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
