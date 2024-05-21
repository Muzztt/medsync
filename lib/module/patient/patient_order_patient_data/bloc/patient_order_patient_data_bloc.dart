import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import '../event/patient_order_patient_data_event.dart';
import '../state/patient_order_patient_data_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientOrderPatientDataBloc
    extends Bloc<PatientOrderPatientDataEvent, PatientOrderPatientDataState>
    implements IBlocBase {
  PatientOrderPatientDataBloc() : super(PatientOrderPatientDataState()) {
    on<PatientOrderPatientDataIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });

    on<PatientOrderPatientDataLoginEvent>((event, emit) async {
      //equatable

      //versi unfreezed
      state.loading = true;
      emit(state.copyWith());

      // //versi freezed
      // emit(state.copyWith(
      //   loading: true,
      // ));

      await AuthService().loginByGoogle();

      state.loading = false;
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
