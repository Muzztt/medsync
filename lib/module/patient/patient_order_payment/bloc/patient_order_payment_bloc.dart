import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/service/order_service/order_service.dart';
import '../event/patient_order_payment_event.dart';
import '../state/patient_order_payment_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientOrderPaymentBloc
    extends Bloc<PatientOrderPaymentEvent, PatientOrderPaymentState>
    implements IBlocBase {
  PatientOrderPaymentBloc() : super(PatientOrderPaymentState()) {
    on<PatientOrderPaymentIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
    on<PatientOrderPaymentCheckoutEvent>((event, emit) async {
      state.loading = true;
      emit(state.copyWith());

      var patientBloc = GetIt.I<PatientOrderPatientDataBloc>();
      var orderDetailBloc = GetIt.I<PatientOrderDetailBloc>();

      print(patientBloc.state);
      print(patientBloc.state);
      await OrderService().createOrder(
        doctorName: orderDetailBloc.state.doctorName,
        specialization: orderDetailBloc.state.spesialization,
        patientName: patientBloc.state.name!,
        dob: patientBloc.state.dob!,
        gender: patientBloc.state.gender!,
        idCard: patientBloc.state.idCard!,
        address: patientBloc.state.address!,
        hospital: state.hospital!,
        payment: state.payment!,
      );

      state.loading = false;
      state.success = true;
      emit(state.copyWith());

      print("Data tersimpan!");
      // Get.offAll(PatientMainNavigationView());
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
