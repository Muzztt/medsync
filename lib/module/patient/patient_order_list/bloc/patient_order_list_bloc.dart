import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_order_list_event.dart';
import '../state/patient_order_list_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientOrderListBloc
    extends Bloc<PatientOrderListEvent, PatientOrderListState>
    implements IBlocBase {
  PatientOrderListBloc() : super(PatientOrderListState()) {
    on<PatientOrderListIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
    on<PatientOrderListDetailEvent>((event, emit) {});
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
