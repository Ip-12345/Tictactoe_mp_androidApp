import 'package:basico/Configs/PageRoute.dart';
import 'package:basico/Pages/Auth/AuthPage.dart';
import 'package:basico/Pages/HomePage/HomePage.dart';
import 'package:basico/Pages/RoomPage/RoomPage.dart';
import 'package:basico/Configs/Theme.dart';
import 'package:basico/Pages/SplashPage/SplashPage.dart';
import 'package:basico/Pages/UpdateProfile/UpdateProfile.dart';
import 'package:basico/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: lightTheme,
      home: SplashPage(),
    );
  }
}
