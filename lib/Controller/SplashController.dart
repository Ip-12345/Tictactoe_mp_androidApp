import 'package:basico/Pages/HomePage/HomePage.dart';
import 'package:basico/Pages/RoomPage/RoomPage.dart';
import 'package:basico/Pages/WelcomePage/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    splashHandle();
    super.onInit();
  }

  Future<void> splashHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    if (auth.currentUser == null) {
      Get.offAll(WelcomePage());
    } else {
      Get.offAll(HomePage());
    }
  }
}
