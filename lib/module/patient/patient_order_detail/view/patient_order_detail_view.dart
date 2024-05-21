import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/widget/container/qcontainer.dart';
import '../bloc/patient_order_detail_bloc.dart';
import '../event/patient_order_detail_event.dart';
import '../state/patient_order_detail_state.dart';
import 'package:get_it/get_it.dart';

class PatientOrderDetailView extends StatefulWidget {
  const PatientOrderDetailView({Key? key}) : super(key: key);

  @override
  State<PatientOrderDetailView> createState() => _PatientOrderDetailViewState();
}

class _PatientOrderDetailViewState extends State<PatientOrderDetailView> {
  PatientOrderDetailBloc bloc = PatientOrderDetailBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientOrderDetailBloc>()) {
      GetIt.I.unregister<PatientOrderDetailBloc>();
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
      child: BlocListener<PatientOrderDetailBloc, PatientOrderDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientOrderDetailBloc, PatientOrderDetailState>(
          builder: (context, state) {
            final bloc = context.read<PatientOrderDetailBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientOrderDetailBloc bloc,
    PatientOrderDetailState state,
  ) {
    return Scaffold(
      body: Padding(
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
                    "Booking Data",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: TextStyle(fontSize: 12.0, color: secondaryTextColor),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Your mobile number",
                    style: TextStyle(fontSize: 12.0, color: secondaryTextColor),
                  ),
                  Text(
                    "08578839239",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Your email",
                    style: TextStyle(fontSize: 12.0, color: secondaryTextColor),
                  ),
                  Text(
                    "08578839239",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Full name",
                    style: TextStyle(fontSize: 12.0, color: secondaryTextColor),
                  ),
                  Text(
                    "Joko Kentir",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            )
          ],
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
            onPressed: () {
              // var stepNavigationController =
              //     GetIt.I<StepNavigationController>();
              var stepNavigationController = StepNavigationController.instance;
              stepNavigationController.updateIndex(2);
              // patientOrderBloc.add(event)
            },
            child: Text(
              "Continue",
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
