import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui_test_test/core.dart';
import '../event/patient_order_payment_detail_event.dart';
import '../state/patient_order_payment_detail_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class PatientOrderPaymentDetailBloc
    extends Bloc<PatientOrderPaymentDetailEvent, PatientOrderPaymentDetailState>
    implements IBlocBase {
  PatientOrderPaymentDetailBloc() : super(PatientOrderPaymentDetailState()) {
    on<PatientOrderPaymentDetailIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
    // on<PatientOrderPaymentDeleteEvent>((event, emit) async {
    //   await OrderService().deleteOrder(orderId);
    //   emit(state.copyWith(orderId: null));
    // });
    // on<PatientOrderPaymentUpdateEvent>((event, emit) async {
    //   await OrderService().updateOrder(
    //     orderId: event.orderId,
    //     patientName: event.patientName,
    //     dob: event.dob,
    //     gender: event.gender,
    //     idCard: event.idCard,
    //     address: event.address,
    //   );
    //   emit(state.copyWith(
    //     orderId: event.orderId,
    //     patientName: event.patientName,
    //     dob: event.dob,
    //     gender: event.gender,
    //     idCard: event.idCard,
    //     address: event.address,
    //   ));
    // });
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
