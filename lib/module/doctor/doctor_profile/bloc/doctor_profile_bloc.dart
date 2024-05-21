import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/doctor_profile_event.dart';
import '../state/doctor_profile_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class DoctorProfileBloc extends Bloc<DoctorProfileEvent, DoctorProfileState>
    implements IBlocBase {
  DoctorProfileBloc() : super(DoctorProfileState()) {
    on<DoctorProfileIncrementEvent>((event, emit) {
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
