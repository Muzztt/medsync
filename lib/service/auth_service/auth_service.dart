import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<bool> loginAsGuest() async {
    await FirebaseAuth.instance.signInAnonymously();
    return true;
  }

  Future<bool> loginByGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (_) {}
    return false;
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static bool get isLoggedIn {
    return FirebaseAuth.instance.currentUser != null;
  }
}
