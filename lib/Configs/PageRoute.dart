import 'package:basico/Controller/RoomController.dart';
import 'package:basico/Pages/Auth/AuthPage.dart';
import 'package:basico/Pages/GamePage/MultiPlayer.dart';
import 'package:basico/Pages/GamePage/SinglePlayer.dart';
import 'package:basico/Pages/HomePage/HomePage.dart';
import 'package:basico/Pages/LobbyPage/LobbyPage.dart';
import 'package:basico/Pages/RoomPage/RoomPage.dart';
import 'package:basico/Pages/SplashPage/SplashPage.dart';
import 'package:basico/Pages/UpdateProfile/UpdateProfile.dart';
import 'package:basico/Pages/WelcomePage/WelcomePage.dart';
import 'package:get/get.dart';

var pages = [
  GetPage(name: "/room", page: () => RoomPage()),
  //GetPage(name: "/lobby", page: () => LobbyPage()),
  GetPage(name: "/auth", page: () => AuthPage()),
  GetPage(name: "/home", page: () => HomePage()),
  GetPage(name: "/splash", page: () => SplashPage()),
  GetPage(
      name: "/multiPlayer",
      page: () {
        RoomController roomController = Get.put(RoomController());
        return MultiPlayerPage(roomId: roomController.roomCode.value);
      }),
  GetPage(name: "/welcome", page: () => WelcomePage()),
  GetPage(name: "/updateProfile", page: () => UpdateProfile()),
  GetPage(name: "/singlePlayer", page: () => SinglePlayer()),
];
