import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_dashboard_event.dart';
import '../state/patient_dashboard_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientDashboardBloc
    extends Bloc<PatientDashboardEvent, PatientDashboardState>
    implements IBlocBase {
  PatientDashboardBloc() : super(PatientDashboardState()) {
    on<PatientDashboardIncrementEvent>((event, emit) {
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
