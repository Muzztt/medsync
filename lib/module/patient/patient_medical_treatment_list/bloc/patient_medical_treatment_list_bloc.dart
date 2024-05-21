import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_medical_treatment_list_event.dart';
import '../state/patient_medical_treatment_list_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientMedicalTreatmentListBloc extends Bloc<
    PatientMedicalTreatmentListEvent,
    PatientMedicalTreatmentListState> implements IBlocBase {
  PatientMedicalTreatmentListBloc()
      : super(PatientMedicalTreatmentListState()) {
    on<PatientMedicalTreatmentListIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
  }

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }
}
