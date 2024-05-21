import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/widget/step_navigation/step_navigation.dart';
import '../bloc/patient_order_bloc.dart';
import '../event/patient_order_event.dart';
import '../state/patient_order_state.dart';
import 'package:get_it/get_it.dart';

class PatientOrderView extends StatefulWidget {
  const PatientOrderView({Key? key}) : super(key: key);

  @override
  State<PatientOrderView> createState() => _PatientOrderViewState();
}

class _PatientOrderViewState extends State<PatientOrderView> {
  PatientOrderBloc bloc = PatientOrderBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientOrderBloc>()) {
      GetIt.I.unregister<PatientOrderBloc>();
    }
    GetIt.I.registerSingleton(bloc);
    bloc.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => bloc.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc,
      child: BlocListener<PatientOrderBloc, PatientOrderState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientOrderBloc, PatientOrderState>(
          builder: (context, state) {
            final bloc = context.read<PatientOrderBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientOrderBloc bloc,
    PatientOrderState state,
  ) {
    return Scaffold(
      body: Container(
        child: StepNavigation(
          initialIndex: 1,
          navigations: [
            "Select Doctor",
            "Order Detail",
            "Patient Data",
            "Payment",
          ],
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/128/10438/10438164.png",
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Developer Mode",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            PatientOrderDetailView(),
            PatientOrderPatientDataView(),
            PatientOrderPaymentView(),
          ],
        ),
      ),
    );
  }
}
