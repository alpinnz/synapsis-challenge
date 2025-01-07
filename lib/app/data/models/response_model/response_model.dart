import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true, genericArgumentFactories: true)
class ResponseModel<T> {
  final int code;
  final bool status;
  final String message;
  final T data;

  const ResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(T value) toJsonT) => _$ResponseModelToJson(this, toJsonT);
}
