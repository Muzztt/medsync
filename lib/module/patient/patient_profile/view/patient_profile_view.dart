import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
import 'package:hyper_ui_test_test/shared/widget/container/qcontainer.dart';
import '../bloc/patient_profile_bloc.dart';
import '../event/patient_profile_event.dart';
import '../state/patient_profile_state.dart';
import 'package:get_it/get_it.dart';

class PatientProfileView extends StatefulWidget {
  const PatientProfileView({Key? key}) : super(key: key);

  @override
  State<PatientProfileView> createState() => _PatientProfileViewState();
}

class _PatientProfileViewState extends State<PatientProfileView> {
  PatientProfileBloc bloc = PatientProfileBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientProfileBloc>()) {
      GetIt.I.unregister<PatientProfileBloc>();
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
      child: BlocListener<PatientProfileBloc, PatientProfileState>(
        listener: (context, state) {
          if (state.logoutSuccess) {
            Get.offAll(LoginView());
          }
        },
        child: BlocBuilder<PatientProfileBloc, PatientProfileState>(
          builder: (context, state) {
            final bloc = context.read<PatientProfileBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientProfileBloc bloc,
    PatientProfileState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.all(20.0),
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
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser?.photoURL ??
                          "https://cdn-icons-png.flaticon.com/128/9131/9131529.png",
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FirebaseAuth.instance.currentUser?.displayName ?? "-",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${FirebaseAuth.instance.currentUser?.email ?? "-"}",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  QContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Divider(),
                        Builder(builder: (context) {
                          List items = [
                            {
                              "label": "My profile",
                              "page": LoginView(),
                            },
                            {
                              "label": "Medical record",
                              "page": LoginView(),
                            },
                            {
                              "label": "Change Password",
                              "page": LoginView(),
                            },
                            {
                              "label": "Change pin",
                              "page": LoginView(),
                            },
                          ];
                          return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              var item = items[index];
                              return InkWell(
                                onTap: () => Get.to(item["page"]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.0,
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        item["label"],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        size: 24.0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
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
                          "Help centre",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Divider(),
                        Builder(builder: (context) {
                          List items = [
                            {
                              "label": "Privacy policy",
                              "page": LoginView(),
                            },
                            {
                              "label": "TOS",
                              "page": LoginView(),
                            },
                            {
                              "label": "Contact us",
                              "page": LoginView(),
                            },
                            {
                              "label": "About us",
                              "page": LoginView(),
                            },
                          ];
                          return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              var item = items[index];
                              return InkWell(
                                onTap: () => Get.to(item["page"]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.0,
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        item["label"],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        size: 24.0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InkWell(
                    onTap: () => bloc.add(PatientProfileLogoutEvent()),
                    child: QContainer(
                      child: Row(
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: secondaryTextColor,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.logout,
                            size: 24.0,
                            color: secondaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
