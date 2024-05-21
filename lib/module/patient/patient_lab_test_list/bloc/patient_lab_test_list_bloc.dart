import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_lab_test_list_event.dart';
import '../state/patient_lab_test_list_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientLabTestListBloc
    extends Bloc<PatientLabTestListEvent, PatientLabTestListState>
    implements IBlocBase {
  PatientLabTestListBloc() : super(PatientLabTestListState()) {
    on<PatientLabTestListIncrementEvent>((event, emit) {
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
