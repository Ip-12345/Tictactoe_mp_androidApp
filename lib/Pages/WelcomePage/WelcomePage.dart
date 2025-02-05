import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Pages/Auth/AuthPage.dart';
import 'package:basico/Pages/RoomPage/RoomPage.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pages = [
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.wlcm1Icon),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'Most fun game now available on your smartphone device!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.wlcm2Icon),
            Text(
              'Compete',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'Play online with your friends and top the leaderboard!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.wlcm3Icon),
            Text(
              'Scoreboard',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'Earn points for each game and make your way to top the scoreboard!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Get.offAll(RoomPage());
              },
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ];

    return Scaffold(
        body: ConcentricPageView(
            colors: [Colors.red, Colors.blue, Colors.green],
            itemCount: 3,
            physics: BouncingScrollPhysics(),
            onFinish: () {
              print('Completed');
              Get.offAll(AuthPage());
            },
            itemBuilder: (index) {
              return pages[index];
            }));
  }
}
