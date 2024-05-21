import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_order_list_state.freezed.dart';

@unfreezed
class PatientOrderListState with _$PatientOrderListState {
  factory PatientOrderListState({
    @Default(0) int counter,
  }) = _PatientOrderListState;
}
