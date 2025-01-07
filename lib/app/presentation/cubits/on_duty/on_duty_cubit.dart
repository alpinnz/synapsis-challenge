import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_duty_cubit.freezed.dart';
part 'on_duty_state.dart';

class OnDutyCubit extends Cubit<OnDutyState> {
  OnDutyCubit() : super(const OnDutyState());
}
