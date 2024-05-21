import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_doctor_list_event.dart';
import '../state/patient_doctor_list_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientDoctorListBloc
    extends Bloc<PatientDoctorListEvent, PatientDoctorListState>
    implements IBlocBase {
  PatientDoctorListBloc() : super(PatientDoctorListState()) {
    on<PatientDoctorListIncrementEvent>((event, emit) {
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
