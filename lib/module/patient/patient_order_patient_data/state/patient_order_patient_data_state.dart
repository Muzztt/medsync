import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_order_patient_data_state.freezed.dart';

@unfreezed
class PatientOrderPatientDataState with _$PatientOrderPatientDataState {
  factory PatientOrderPatientDataState({
    @Default(0) int counter,
    @Default(false) bool loading,
    @Default("") String errorMessage,
    @Default(null) String? successMessage,
    @Default(null) String? orderId,
    @Default(null) String? name,
    @Default(null) DateTime? dob,
    @Default(null) String? gender,
    @Default(null) String? idCard,
    @Default(null) String? address,
  }) = _PatientOrderPatientDataState;
}
