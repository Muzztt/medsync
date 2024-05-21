import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_order_payment_detail_state.freezed.dart';

@unfreezed
class PatientOrderPaymentDetailState with _$PatientOrderPaymentDetailState {
  factory PatientOrderPaymentDetailState({
    @Default(0) int counter,
    @Default(null) String? orderId,
    @Default(null) String? patientName,
    @Default(null) String? dob,
    @Default(null) String? gender,
    @Default(null) String? idCard,
    @Default(null) String? address,
  }) = _PatientOrderPaymentDetailState;
}
