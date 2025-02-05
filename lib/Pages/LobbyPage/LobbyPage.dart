import 'package:basico/Components/PrimaryButton.dart';
import 'package:basico/Components/UserCard.dart';
import 'package:basico/Configs/AssestsPath.dart';
import 'package:basico/Configs/Messages.dart';
import 'package:basico/Controller/LobbyController.dart';
import 'package:basico/Controller/RoomController.dart';
import 'package:basico/Pages/GamePage/MultiPlayer.dart';
import 'package:basico/Pages/LobbyPage/Widgets/PricingArea.dart';
import 'package:basico/Pages/LobbyPage/Widgets/RoomInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LobbyPage extends StatelessWidget {
  final String roomId;
  const LobbyPage({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    LobbyController lobbyController = Get.put(LobbyController());
    RoomController roomController = Get.put(RoomController());
    RxInt timer = 5.obs;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(IconsPath.backIcon),
                      ),
                      SizedBox(width: 15),
                      Text("Play With Private Room",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 20),
                  RoomInfo(roomCode: roomId),
                  //fee
                  SizedBox(height: 40),
                  StreamBuilder(
                      stream: lobbyController.getRoomDetails(roomId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasData) {
                          if (snapshot.data!.player1Status == "ready" &&
                              snapshot.data!.player2Status == "ready") {
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Get.to(MultiPlayerPage(roomId: roomId));
                            });
                          } else {}
                          return Column(
                            children: [
                              PriceArea(
                                entryFee: snapshot.data!.entryFee!,
                                winningPrize: snapshot.data!.winningPrize!!,
                              ),
                              SizedBox(height: 70),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UserCard(
                                    imageUrl: snapshot.data!.player1!.image! ??
                                        defaultImage,
                                    name: snapshot.data!.player1!.name!,
                                    coins: "00",
                                    status: snapshot.data!.player1Status!,
                                  ),
                                  snapshot.data!.player2 == null
                                      ? Container(
                                          width: w / 2.6,
                                          child: Text("Waiting for other"),
                                        )
                                      : UserCard(
                                          imageUrl:
                                              snapshot.data!.player2!.image!,
                                          name: snapshot.data!.player2!.name!,
                                          coins: "00",
                                          status: snapshot.data!.player2Status!,
                                        )
                                ],
                              ),
                              const SizedBox(height: 20),
                              snapshot.data!.player1!.email ==
                                      roomController.user.value.email
                                  ? Primarybutton(
                                      buttonText: "Start Game",
                                      onTap: () {
                                        lobbyController.updatePlayer1Status(
                                            roomId, "ready");
                                      })
                                  : snapshot.data!.player2Status == "waiting"
                                      ? Primarybutton(
                                          buttonText: "Ready",
                                          onTap: () {
                                            lobbyController.updatePlayer2Status(
                                                roomId, "ready");
                                          })
                                      : snapshot.data!.player2Status == "ready"
                                          ? Primarybutton(
                                              buttonText: "Waiting for start",
                                              onTap: () {
                                                lobbyController
                                                    .updatePlayer2Status(
                                                        roomId, "wating");
                                              })
                                          : Primarybutton(
                                              buttonText: "Start", onTap: () {})
                            ],
                          );
                        } else {
                          return Icon(Icons.error);
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
