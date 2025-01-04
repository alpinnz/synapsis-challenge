import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class DataState<T> extends Equatable with _$DataState<T> {
  const DataState._();

  const factory DataState.success({
    required T data,
  }) = _Success<T>;

  const factory DataState.failed({
    required FlutterError error,
  }) = _Failed<T>;

  @override
  List<Object?> get props => [hashCode];
}
