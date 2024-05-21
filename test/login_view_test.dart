import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hyper_ui_test_test/firebase_options.dart';
import 'package:hyper_ui_test_test/module/auth/login/view/login_view.dart';

void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });
  testWidgets('LoginView has required widgets', (WidgetTester tester) async {
    // Build the LoginView widget.
    await tester.pumpWidget(MaterialApp(home: LoginView()));

    // Verify the presence of the specific images using Key.
    expect(find.byKey(Key('login_image')), findsOneWidget);
    expect(find.byKey(Key('doctor_image')), findsOneWidget);

    // Verify the presence of the icons using Key.
    expect(find.byKey(Key('phone_icon')), findsOneWidget);
    expect(find.byKey(Key('facebook_icon')), findsOneWidget);
    expect(find.byKey(Key('google_icon')), findsOneWidget);

    // Verify the presence of the texts using Key.
    expect(find.byKey(Key('phone_text')), findsOneWidget);
    expect(find.byKey(Key('facebook_text')), findsOneWidget);
    expect(find.byKey(Key('google_text')), findsOneWidget);
    expect(find.byKey(Key('email_signin_text')), findsOneWidget);

    // Verify the presence of the login buttons.
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });
}
