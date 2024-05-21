import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/module/patient/patient_order_payment_detail/widget/show_dialog.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
import 'package:hyper_ui_test_test/shared/widget/container/qcontainer.dart';
import '../bloc/patient_order_payment_detail_bloc.dart';
import '../event/patient_order_payment_detail_event.dart';
import '../state/patient_order_payment_detail_state.dart';
import 'package:get_it/get_it.dart';

class PatientOrderPaymentDetailView extends StatefulWidget {
  final String orderId;
  const PatientOrderPaymentDetailView({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<PatientOrderPaymentDetailView> createState() =>
      _PatientOrderPaymentDetailViewState();
}

class _PatientOrderPaymentDetailViewState
    extends State<PatientOrderPaymentDetailView> {
  PatientOrderPaymentDetailBloc bloc = PatientOrderPaymentDetailBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientOrderPaymentDetailBloc>()) {
      GetIt.I.unregister<PatientOrderPaymentDetailBloc>();
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
      child: BlocListener<PatientOrderPaymentDetailBloc,
          PatientOrderPaymentDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientOrderPaymentDetailBloc,
            PatientOrderPaymentDetailState>(
          builder: (context, state) {
            final bloc = context.read<PatientOrderPaymentDetailBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientOrderPaymentDetailBloc bloc,
    PatientOrderPaymentDetailState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PatientOrderPaymentDetail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("orders").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text("Error");
                if (snapshot.data == null) return Container();
                if (snapshot.data!.docs.isEmpty) {
                  return Text("No Data");
                }
                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.docs.length,
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item =
                        (data.docs[index].data() as Map<String, dynamic>);
                    item["id"] = data.docs[index].id;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: QContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Patient Data",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: secondaryTextColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              item["patient"]["name"] ?? "-",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              "29/12/01",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              "${FirebaseAuth.instance.currentUser?.email ?? "-"}",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Id Card",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              item["patient"]["id_card"] ?? "-",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              item["patient"]["address"] ?? "-",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              item["patient"]["gender"] ?? "-",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Payment",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            // Text(
                            //   item["patient"]["payment"] ?? "-",
                            //   style: TextStyle(
                            //     fontSize: 12.0,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Hospital",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                            // Text(
                            //   item["patient"]["hospital"] ?? "-",
                            //   style: TextStyle(
                            //     fontSize: 12.0,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 42,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  foregroundColor: infoColor,
                  side: BorderSide(
                    color: infoColor,
                  ),
                ),
                onPressed: () {
                  bloc.add(
                    PatientOrderPaymentUpdateEvent(
                        // orderId: orderId,
                        // patientName: patientName,
                        // dob: dob,
                        // gender: gender,
                        // idCard: idCard,
                        // address: address,
                        ),
                  );
                  // var stepNavigationController =
                  //     StepNavigationController.instance;
                  // stepNavigationController.updateIndex(3);
                },
                child: const Text("Edit data patient"),
              ),
            ),
            const SizedBox(height: 8.0), // Memberikan jarak antara kedua tombol
            TextButton(
              onPressed: () {
                showCancelAppointmentBottomSheet(context, bloc, state);
              },
              style: TextButton.styleFrom(
                foregroundColor: secondaryTextColor,
              ),
              child: const Text("Cancel my promise"),
            ),
          ],
        ),
      ),
    );
  }
}
