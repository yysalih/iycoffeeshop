import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/auth_controller.dart';



class Authentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> initializeGoogleSignIn() async {

    try {
      if (!kIsWeb) {
        await GoogleSignIn.instance.initialize();
        debugPrint("GoogleSignIn initialized successfully.");
      } else {
        debugPrint("GoogleSignIn: Web initialization handled by FirebaseAuth.");
      }
      debugPrint("GoogleSignIn initialized successfully.");
    } catch (e, stackTrace) {
      debugPrint("Error initializing GoogleSignIn: $e");
      debugPrint(stackTrace.toString());
    }
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;

      await initializeGoogleSignIn();

      if (kIsWeb) {

        final provider = GoogleAuthProvider();
        provider.setCustomParameters({'prompt': 'select_account'});

        final UserCredential userCredential =
        await _auth.signInWithPopup(provider);
        user = userCredential.user;

        debugPrint("Google Sign-In successful on web: ${user?.email}");
        return user;
      }

      const scopes = [
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'openid',
      ];
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      final GoogleSignInAccount googleSignInAccount = await googleSignIn.authenticate(scopeHint: scopes);



      final googleSignInAuthentication = googleSignInAccount.authentication;
      final googleAuthorization = await googleSignInAccount.authorizationClient.authorizationForScopes(scopes);


      if (googleAuthorization == null) {
        debugPrint("GoogleSignIn: ID token is null after authentication.");
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(content: 'Could not retrieve Google ID token.'),
        );
        return null;
      }

      if (googleSignInAuthentication.idToken == null) {
        debugPrint("GoogleSignIn: ID token is null after authentication.");
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(content: 'Could not retrieve Google ID token.'),
        );
        return null;
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuthorization.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);

        user = userCredential.user;
      }
      on FirebaseAuthException catch (e, stackTrace) {

        debugPrint(e.toString());
        debugPrint(stackTrace.toString());
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
              'The account already exists with a different credential',
            ),
          );
        }
        else if (e.code == 'invalid-credential') {
          debugPrint(e.toString());
          debugPrint(stackTrace.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
              'Error occurred while accessing credentials. Try again.',
            ),
          );
        }

      } catch (e,stackTrace) {
        debugPrint(e.toString());
        debugPrint(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign In. Try again.',
          ),
        );
      }

      return user;
    }
    catch(e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      /*showDialog(context: context, builder: (context) => AlertDialog(
        title: SelectableText(e.toString()),
        content: SelectableText(stackTrace.toString()),
      ),);*/
      return null;
    }
  }

  static Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }

  static Future<UserCredential> signInAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<bool> initializeFirebase({required AuthController authNotifier}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userExists = await authNotifier.checkIfUserExists(_auth.currentUser);

    try {
      if (prefs.getString("uid") == null) return false;
      return userExists;
    }
    catch (E, stackTrace) {
      debugPrint("Error initializing Firebase Auth: $E");
      debugPrint("Error initializing Firebase Auth: $stackTrace");
      return false;
    }

  }

  static Future<void> signOut({required BuildContext context}) async {

    try {
      await FirebaseAuth.instance.signOut();
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  /*static Future<void> initializeFirebase({required BuildContext context, required AuthController authNotifier}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    User? user = FirebaseAuth.instance.currentUser;

    bool userExists = await authNotifier.checkIfUserExists(user);

    try {
      if(prefs.getString("uid") != null && userExists) {
        await authNotifier.getCurrentUser();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainView(),), (route) => false);
      }
      else {
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginView(),), (route) => false);

      }

    }
    catch (E) {

    }

  }*/

  static Future<User?> signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  static Future<User?> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

}