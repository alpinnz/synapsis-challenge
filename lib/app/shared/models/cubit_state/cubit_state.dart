import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/shared/models/status/status.dart';

part 'cubit_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class CubitState<T> extends Equatable with _$CubitState<T> {
  const CubitState._();

  const factory CubitState({
    T? data,
    @Default(Status.initial()) Status status,
  }) = _CubitState<T>;

  @override
  List<Object?> get props => [status, data];
}
