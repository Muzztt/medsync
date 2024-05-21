import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/module/patient/patient_main_navigation/view/patient_main_navigation_view.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
import 'package:hyper_ui_test_test/shared/util/validator/validator.dart';
import 'package:hyper_ui_test_test/shared/widget/container/qcontainer.dart';
import 'package:hyper_ui_test_test/shared/widget/form/button/action_button.dart';
import 'package:hyper_ui_test_test/shared/widget/form/radio/radio2.dart';
import 'package:hyper_ui_test_test/state_util.dart';
import '../bloc/patient_order_payment_bloc.dart';
import '../event/patient_order_payment_event.dart';
import '../state/patient_order_payment_state.dart';
import 'package:get_it/get_it.dart';

class PatientOrderPaymentView extends StatefulWidget {
  const PatientOrderPaymentView({Key? key}) : super(key: key);

  @override
  State<PatientOrderPaymentView> createState() =>
      _PatientOrderPaymentViewState();
}

class _PatientOrderPaymentViewState extends State<PatientOrderPaymentView> {
  PatientOrderPaymentBloc bloc = PatientOrderPaymentBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientOrderPaymentBloc>()) {
      GetIt.I.unregister<PatientOrderPaymentBloc>();
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
      child: BlocListener<PatientOrderPaymentBloc, PatientOrderPaymentState>(
        listener: (context, state) {
          //navigasi, bottomsheet, snackbar, dialog
          if (state.success) {
            Get.offAll(PatientMainNavigationView());
          }
        },
        child: BlocBuilder<PatientOrderPaymentBloc, PatientOrderPaymentState>(
          builder: (context, state) {
            final bloc = context.read<PatientOrderPaymentBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientOrderPaymentBloc bloc,
    PatientOrderPaymentState state,
  ) {
    if (state.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selected Doctor",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24.0,
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZG9jdG9yfGVufDB8fDB8fHww",
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        "drg. Gunawan Raharjo, Sp.Kg",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Dokter Konservasi Gigi",
                        style: TextStyle(
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                    Divider(),
                    Text(
                      "Location & Practical Schedule",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        height: 48.0,
                        width: 48.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1587351021759-3e566b6af7cc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODh8fGhvc3BpdGFsfGVufDB8fDB8fHww"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        "RS Gatoel Mojokerto",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Monday, 16 October 2023",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: secondaryTextColor,
                            ),
                          ),
                          Text(
                            "16.30 - 18.30 PM",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: secondaryTextColor,
                            ),
                          ),
                          Text(
                            "Consultation Fee Rp100.000,-",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: warningColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              QContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sebentar Lagi Selesai!",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "Selesaikan proses buat janji dengan melengkapi data berikut:",
                      style:
                          TextStyle(fontSize: 12.0, color: secondaryTextColor),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Apakah Pasien sudah pernah berobat di Rumah Sakit ini ? ",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    QRadioField2(
                      label: "select treatment status",
                      validator: Validator.atLeastOneitem,
                      items: [
                        {
                          "label": "Ya, Sudah Pernah",
                          "value": "Ya, Sudah Pernah",
                        },
                        {
                          "label": "Belum Pernah",
                          "value": "Belum Pernah",
                        }
                      ],
                      onChanged: (value, label) {
                        // bloc.state.hospital = value.toString();
                        // bloc.emit(bloc.state.copyWith());
                        state.hospital = value;
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Metode Pembayaran",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    QRadioField2(
                      label: "select payment method",
                      validator: Validator.atLeastOneitem,
                      items: [
                        {
                          "label": "Dana Pribadi",
                          "value": "Dana Pribadi",
                        },
                        {
                          "label": "Asuransi",
                          "value": "Asuransi",
                        }
                      ],
                      onChanged: (value, label) {
                        state.payment = value;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              backgroundColor: warningColor,
            ),
            onPressed: () => bloc.add(PatientOrderPaymentCheckoutEvent()),
            child: Text(
              "Finish & Make an Appointment",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
