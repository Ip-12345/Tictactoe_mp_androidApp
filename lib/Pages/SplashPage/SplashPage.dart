import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(child: SvgPicture.asset(IconsPath.logoIcon, width: 150)),
    );
  }
}
