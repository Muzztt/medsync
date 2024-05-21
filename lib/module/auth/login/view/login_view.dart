import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import '../bloc/login_bloc.dart';
import '../event/login_event.dart';
import '../state/login_state.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc bloc = LoginBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<LoginBloc>()) {
      GetIt.I.unregister<LoginBloc>();
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
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isLoginSuccess) {
            Get.offAll(
              PatientMainNavigationView(),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginBloc bloc,
    LoginState state,
  ) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff006dfa),
              Color(0xff003e88),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/icon.png",
                          fit: BoxFit.fill,
                          key: Key('login_image'),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon/doctor.png",
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                        key: Key('doctor_image'),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 46,
                  //   child: ElevatedButton.icon(
                  //     icon: const Icon(Icons.phone_android_sharp),
                  //     label: const Text("Guest login"),
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(2.0)),
                  //       backgroundColor: Colors.white,
                  //       foregroundColor: infoColor,
                  //     ),
                  //     onPressed: () => bloc.add(LoginByGuestEvent()),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 12.0,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.phone_android_sharp,
                          key: Key('phone_icon')),
                      label: const Text("Login by phone number",
                          key: Key('phone_text')),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        backgroundColor: Colors.white,
                        foregroundColor: infoColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    child: ElevatedButton.icon(
                      icon:
                          const Icon(Icons.facebook, key: Key('facebook_icon')),
                      label: const Text("Login by Facebook",
                          key: Key('facebook_text')),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        backgroundColor: infoColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    child: ElevatedButton.icon(
                      icon: Icon(MdiIcons.google, key: Key('google_icon')),
                      label: const Text("Login by Google",
                          key: Key('google_text')),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        backgroundColor: dangerColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Get.offAll(PatientMainNavigationView());
                        bloc.add(LoginByGoogleEvent());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign in with Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      key: Key('email_signin_text'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
