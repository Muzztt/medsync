import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_order_payment_state.freezed.dart';

@unfreezed
class PatientOrderPaymentState with _$PatientOrderPaymentState {
  factory PatientOrderPaymentState({
    @Default(0) int counter,
    @Default(false) bool loading,
    @Default(false) bool success,
    @Default(null) String? hospital,
    @Default(null) String? payment,
  }) = _PatientOrderPaymentState;
}
