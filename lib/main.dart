import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hyper_ui_test_test/service/gemini_service/gemini_service.dart';
import 'package:hyper_ui_test_test/state_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui_test_test/debug.dart';
import 'package:hyper_ui_test_test/firebase_options.dart';
import 'package:hyper_ui_test_test/service/auth_service/auth_service.dart';

void main() async {
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mainView = LoginView();
    if (AuthService.isLoggedIn) {
      mainView = PatientMainNavigationView();
    }
    return MaterialApp(
      title: 'MedSync',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: mainView,
    );
  }
}
