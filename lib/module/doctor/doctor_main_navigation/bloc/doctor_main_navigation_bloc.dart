import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/doctor_main_navigation_event.dart';
import '../state/doctor_main_navigation_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class DoctorMainNavigationBloc
    extends Bloc<DoctorMainNavigationEvent, DoctorMainNavigationState>
    implements IBlocBase {
  DoctorMainNavigationBloc() : super(DoctorMainNavigationState()) {
    on<DoctorMainNavigationIncrementEvent>((event, emit) {
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
