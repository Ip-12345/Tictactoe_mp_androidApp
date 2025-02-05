import 'package:basico/Controller/LobbyController.dart';
import 'package:basico/Controller/RoomController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:get/get.dart';

class RoomInfo extends StatelessWidget {
  final String roomCode;
  const RoomInfo({super.key, required this.roomCode});

  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.put(RoomController());
    LobbyController lobbyController = Get.put(LobbyController());
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                children: [Text("Generated Room Code")],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          roomCode,
                          style: TextStyle(
                              fontSize: w / 11,
                              letterSpacing: 2.4,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      lobbyController.copyRoomCode(roomCode);
                    },
                    child: Container(
                      padding: EdgeInsets.all(13),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.secondary),
                      child: SvgPicture.asset(IconsPath.copyIcon),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                  "Share This Private Code with your Friends & Ask Theme To Join The Game",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ],
          )),
        ],
      ),
    );
  }
}
