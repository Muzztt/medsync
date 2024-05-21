import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/module/patient/patient_dashboard/widget/patient_dashboard_search.dart';
import 'package:hyper_ui_test_test/shared/widget/navigation/custom_tab_navigation/custom_tab_navigation.dart';
import '../../../../core.dart';
import '../bloc/patient_dashboard_bloc.dart';
import '../event/patient_dashboard_event.dart';
import '../state/patient_dashboard_state.dart';
import 'package:get_it/get_it.dart';

class PatientDashboardView extends StatefulWidget {
  const PatientDashboardView({Key? key}) : super(key: key);

  @override
  State<PatientDashboardView> createState() => _PatientDashboardViewState();
}

class _PatientDashboardViewState extends State<PatientDashboardView> {
  PatientDashboardBloc bloc = PatientDashboardBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientDashboardBloc>()) {
      GetIt.I.unregister<PatientDashboardBloc>();
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
      child: BlocListener<PatientDashboardBloc, PatientDashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientDashboardBloc, PatientDashboardState>(
          builder: (context, state) {
            final bloc = context.read<PatientDashboardBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientDashboardBloc bloc,
    PatientDashboardState state,
  ) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'MedSync',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(PatientChatView());
            },
            icon: const Icon(
              Icons.chat_sharp,
              size: 28.0,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          CircleAvatar(
            radius: 16.0,
            backgroundImage: NetworkImage(
              FirebaseAuth.instance.currentUser?.photoURL ??
                  "https://cdn-icons-png.flaticon.com/128/9131/9131529.png",
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff0351c0),
                    Color(0xff6c96de),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffee5693),
                          child: Icon(
                            MdiIcons.calendar,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buat Janji Konsultasi",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Proses singkat, Bayar Cepat",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    PatientDashboardSearch(),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: CustomTabNavigation(
                        headers: [
                          "Dokter",
                          "Lab Test",
                          "Medical Treatment",
                        ],
                        children: [
                          PatientDoctorListView(),
                          PatientLabTestListView(),
                          PatientMedicalTreatmentListView()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
