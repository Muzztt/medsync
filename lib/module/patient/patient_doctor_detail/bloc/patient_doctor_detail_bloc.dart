import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_doctor_detail_event.dart';
import '../state/patient_doctor_detail_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientDoctorDetailBloc
    extends Bloc<PatientDoctorDetailEvent, PatientDoctorDetailState>
    implements IBlocBase {
  PatientDoctorDetailBloc() : super(PatientDoctorDetailState()) {
    on<PatientDoctorDetailIncrementEvent>((event, emit) {
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
