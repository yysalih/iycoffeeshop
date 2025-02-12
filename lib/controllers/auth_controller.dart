import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/snackbars.dart';
import 'package:iycoffee/controllers/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import '../constants/languages.dart';
import '../constants/providers.dart';
import '../models/user_model.dart';
import '../services/authentication_service.dart';
import '../views/auth_views/fill_out_view.dart';
import '../views/main_view.dart';

class AuthState {

  final UserModel currentUser;
  final File photo;
  final bool isCompleted;
  final String image;
  final bool isRegister;


  AuthState({

    required this.currentUser,
    required this.photo,
    required this.image,
    this.isCompleted = false,
    this.isRegister = false,
  });

  AuthState copyWith({

    UserModel? currentUser,
    File? photo,
    bool? isCompleted,
    bool? isRegister,
    String? image,
  }) {
    return AuthState(
      currentUser: currentUser ?? this.currentUser,
      photo: photo ?? this.photo,
      isCompleted: isCompleted ?? this.isCompleted,
      image: image ?? this.image,
      isRegister: isRegister ?? this.isRegister,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state);

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool get isAbleToContinue => nameController.text.isNotEmpty &&
      surnameController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
      emailController.text.isNotEmpty;

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  switchRegister() {
    state = state.copyWith(isRegister: !state.isRegister);
  }


  Future<bool> checkIfUserExists() async {
    final response = await http.post(
      appUrl,
      body: {
        'singleQuery': "SELECT * FROM users WHERE uid = '${currentUser!.uid}'",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      debugPrint(data.runtimeType.toString());

      if (data.toString().contains("error")) {
        return false;
      } else {
        return true;
      }
    } else {
      debugPrint('Error: ${response.statusCode}');
      debugPrint('Error: ${response.reasonPhrase}');
      return false;
    }
  }

  createUser({required BuildContext context, required String errorTitle}) async {

    String? token = await FirebaseMessaging.instance.getToken();

    UserModel userModel = UserModel(
        name: nameController.text,
        image: currentUser!.photoURL ?? "",
        uid: currentUser!.uid,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        lastname: surnameController.text,
        token: token,
    );

    final response = await http.post(
      appUrl,
      body: {
        'executeQuery':
        "INSERT INTO users (${userModel.getDbFields()}) VALUES (${userModel.questionMarks})",
        "params": jsonEncode(userModel.getDbFormat()),
      },
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      var data = jsonDecode(response.body);
      debugPrint('Response: $data');
      Navigator.push(context, routeToView(const MainView()));
    } else {
      debugPrint('Error: ${response.statusCode}');
      debugPrint('Error: ${response.reasonPhrase}');
      showSnackbar(title: errorTitle, context: context);
    }
  }

  getCurrentUser() async {
    final response = await http.post(
      appUrl,
      body: {
        'singleQuery':
        "SELECT * FROM users WHERE uid = '${FirebaseAuth.instance.currentUser!.uid}'",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel userModel = UserModel().fromJson(data);
      debugPrint('UserModel: ${userModel.toJson().toString()}');

      if (data.toString().contains("error")) {
        return false;
      } else {
        state = state.copyWith(currentUser: userModel);
        return true;
      }
    } else {
      debugPrint('Error: ${response.statusCode}');
      debugPrint('Error: ${response.reasonPhrase}');
      return false;
    }
  }

  editUser(
      {required BuildContext context,
        required String image,
        required String errorTitle,
        required String succesTitle}) async {
    UserModel userModel = UserModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        image: image,
        uid: currentUser!.uid,
        password: state.currentUser.password,
        lastname: state.currentUser.lastname,
        token: state.currentUser.token,
    );

    final response = await http.post(
      appUrl,
      body: {
        'executeQuery': """
        UPDATE users 
        SET 
          name = ?,
          email = ?,
          phone = ?
        WHERE 
          uid = '${currentUser!.uid}'
      """,
        "params": jsonEncode([
          userModel.name,
          userModel.email,
          userModel.phone
        ]),
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      var data = jsonDecode(response.body);
      debugPrint('Response: $data');

      if (!data.toString().contains("error")) {
        state = state.copyWith(currentUser: userModel);
        Navigator.push(context, routeToView(const MainView()));
        showSnackbar(title: succesTitle, context: context);
      } else {
        showSnackbar(title: errorTitle, context: context);
      }
    } else {
      debugPrint('Error: ${response.statusCode}');
      debugPrint('Error: ${response.reasonPhrase}');
      showSnackbar(title: errorTitle, context: context);
    }
  }

  handleSignIn(AuthController authNotifier,
      {required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User? user = await Authentication.signInWithGoogle(context: context);

    if (user != null) {
      prefs.setString("uid", user.uid);

      bool isUserExists = await authNotifier.checkIfUserExists();

      if (isUserExists) {
        Navigator.push(context, routeToView(const MainView()));
      } else {
        //await authWatch.createNewUser(user.uid, user);
        Navigator.push(context, routeToView(const FillOutView()));
      }
    }
  }

  handleSignInWithApple(AuthController authNotifier,
      {required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserCredential? userCredential = await Authentication.signInWithApple();

    if (userCredential.user != null) {
      final user = userCredential.user!;
      prefs.setString("uid", user.uid);

      bool isUserExists = await authNotifier.checkIfUserExists();

      if (isUserExists) {
        Navigator.push(context, routeToView(const MainView()));
      } else {
        //await authWatch.createNewUser(user.uid, user);
        Navigator.push(context, routeToView(const FillOutView()));
      }
    }
  }

  handleSignInWithEmail(AuthController authNotifier,
      {required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User? user = state.isRegister
        ? await Authentication.signUp(
        email: authNotifier.emailController.text,
        password: authNotifier.passwordController.text)
        : await Authentication.signIn(
        email: authNotifier.emailController.text,
        password: authNotifier.passwordController.text);

    if (user != null) {
      prefs.setString("uid", user.uid);

      bool isUserExists = await authNotifier.checkIfUserExists();

      if (isUserExists) {
        Navigator.push(context, routeToView(const MainView()));
      } else {
        //await authWatch.createNewUser(user.uid, user);
        Navigator.push(context, routeToView(const FillOutView()));
      }
    }
  }

  handleSignInAnonymous(AuthController authNotifier,
      {required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserCredential? userCredential = await Authentication.signInAnonymously();

    if (userCredential.user != null) {
      final user = userCredential.user!;
      prefs.setString("uid", user.uid);

      bool isUserExists = await authNotifier.checkIfUserExists();

      if (isUserExists) {
        Navigator.push(context, routeToView(const MainView()));
      } else {
        Navigator.push(context, routeToView(const MainView()));
      }
    }
  }



  Future imgFromCamera(String type, BuildContext context) async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 25);
    if (pickedFile != null) {
      state = state.copyWith(photo: File(pickedFile.path));
      uploadFile(type);
    } else {
      debugPrint('No image selected.');
    }
  }

  Future imgFromGallery(String type, BuildContext context) async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      state = state.copyWith(photo: File(pickedFile.path));
      uploadFile(type);
    } else {
      debugPrint('No image selected.');
    }
  }

  Future uploadFile(String type) async {
    final fileName = basename(state.photo.path);

    state = state.copyWith(isCompleted: true);

    final destination = 'registers/$currentUserUid/$type-$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination);
      await ref.putFile(state.photo);
      var pathReference =
      _storage.ref('registers/$currentUserUid/$type-$fileName');

      pathReference.getDownloadURL().then((value) async {
        state = state.copyWith(
          isCompleted: true,
          image: value,

        );

      });
    } catch (e) {
      debugPrint('error occurred: $e');
    }
  }

  showPicker(BuildContext context,
      {required String language, required String type}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: kLightBlack,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera,
                    color: kWhite,
                  ),
                  title: Text(
                    languages[language]!["camera"]!,
                    style: kCustomTextStyle,
                  ),
                  onTap: () {
                    imgFromCamera(type, context);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.image,
                    color: kWhite,
                  ),
                  title: Text(languages[language]!["gallery"]!,
                      style: kCustomTextStyle),
                  onTap: () {
                    imgFromGallery(type, context);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

}

final authController = StateNotifierProvider<AuthController, AuthState>(
      (ref) => AuthController(
    AuthState(

      currentUser: UserModel(),
      photo: File(""),
      image: "",
    ),
  ),
);