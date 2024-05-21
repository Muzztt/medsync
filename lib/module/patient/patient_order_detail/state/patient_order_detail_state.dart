import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_order_detail_state.freezed.dart';

@unfreezed
class PatientOrderDetailState with _$PatientOrderDetailState {
  factory PatientOrderDetailState({
    @Default(0) int counter,
    @Default("Dr. Gunawan") String doctorName,
    @Default("Spesialis Anak") String spesialization,
  }) = _PatientOrderDetailState;
}
