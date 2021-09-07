import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/model/user_model.dart';
import 'package:shopping_app/service/firebase/firestore_user.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/screens/home_screen.dart';

class AuthViewModel extends GetxController {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Rxn<User?> _currentUser = Rxn<User>();

  String? get currentUser => _currentUser.value?.email;

  var currentLoggedIn;

  @override
  void onInit() {
    super.onInit();
    _currentUser.bindStream(_firebaseAuth.authStateChanges());
  }

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    update();
  }

  void createAccountWithEmailAndPassword(BuildContext context) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((userCredential) => saveUser(userCredential));
      Navigator.of(context).push(AnimatePage.createRoute(HomeScreen()));
    } on FirebaseAuthException catch (e) {
      displayError(e);
    }
  }

  signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      Navigator.of(context).push(AnimatePage.createRoute(HomeScreen()));
    } on FirebaseAuthException catch (e) {
      displayError(e);
    }
  }

  void signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      try {
        await _firebaseAuth
            .signInWithCredential(credential)
            .then((userCredential) {
          print('successfully logged in with google');
          saveUser(userCredential);
        });
        Navigator.of(context).push(AnimatePage.createRoute(HomeScreen()));
      } on FirebaseAuthException catch (e) {
        displayError(e);
      }
    }
  }

  // void facebookSignInMethod() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //
  //   try {
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(result.accessToken!.token);
  //
  //     await _firebaseAuth
  //         .signInWithCredential(facebookAuthCredential)
  //         .then((user) {
  //       saveUser(user);
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void displayError(FirebaseAuthException e) {
    Get.snackbar('Error login account', e.code.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2));
  }

  saveUser(UserCredential? userCredential) {
    User? user = userCredential?.user;
    UserModel userModel = UserModel(
      userId: user?.uid,
      userFirstName: user?.displayName == null ? firstName : user?.displayName,
      userLastName: user?.displayName == null ? lastName : user?.displayName,
      userEmail: user?.email,
      userPassword: password == null ? '' : password,
    );
    FirestoreUser().saveUserOnFirestore(userModel);
  }
}
