import 'package:basico/Configs/Messages.dart';
import 'package:basico/Models/RoomModel.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;
  RxInt waitingTime = 5.obs;

  void copyRoomCode(String roomCode) {
    FlutterClipboard.copy(roomCode).then((value) => successMessage("Copied!"));
  }

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db
        .collection("rooms")
        .doc(roomId)
        .snapshots()
        .map((event) => RoomModel.fromJson(event.data()!));
  }

  Future<void> startGame() async {
    await timer(waitingTime.value);
  }

  Future<void> timer(int time) async {
    while (time > 0) {
      Future.delayed(Duration(seconds: 1));
      time--;
      waitingTime.value = time;
    }
  }

  Future<void> updatePlayer1Status(String roomId, String status) async {
    await db.collection("rooms").doc(roomId).update({"player1Status": status});
  }

  Future<void> updatePlayer2Status(String roomId, String status) async {
    await db.collection("rooms").doc(roomId).update({"player2Status": status});
  }
}
