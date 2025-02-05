import 'package:basico/Configs/Messages.dart';
import 'package:basico/Models/UserModel.dart';
import 'package:basico/Pages/HomePage/HomePage.dart';
import 'package:basico/Pages/UpdateProfile/UpdateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController {
  final auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await auth.signInWithCredential(credential);
      successMessage('Login Success');
      Get.to(UpdateProfile());
    } catch (e) {
      errorMessage('Login Failed');
      print(e);
    }
  }
}
