import 'package:basico/Models/UserModel.dart';

class RoomModel {
  String? id;
  String? entryFee;
  String? winningPrize;
  String? drawMatch;
  UserModel? player1;
  UserModel? player2;
  String? gameStatus;
  String? player1Status;
  String? player2Status;
  List<String>? gameValue;
  bool? isXTurn;

  RoomModel({
    this.id,
    this.entryFee,
    this.winningPrize,
    this.drawMatch,
    this.player1,
    this.player2,
    this.gameStatus,
    this.player1Status,
    this.player2Status,
    this.gameValue,
    this.isXTurn,
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    entryFee = json["entryFee"];
    winningPrize = json["winningPrize"];
    drawMatch = json["drawMatch"];
    player1 =
        json["player1"] != null ? UserModel.fromJson(json["player1"]) : null;
    player2 =
        json["player2"] != null ? UserModel.fromJson(json["player2"]) : null;
    gameStatus = json["gameStatus"];
    player1Status = json["player1Status"];
    player2Status = json["player2Status"];
    gameValue =
        json["gameValue"] != null ? List<String>.from(json["gameValue"]) : null;
    isXTurn = json["isXTurn"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? '',
      "entryFee": entryFee ?? '',
      "winningPrize": winningPrize ?? '',
      "drawMatch": drawMatch ?? '',
      "player1": player1?.toJson(),
      "player2": player2?.toJson(),
      "gameStatus": gameStatus ?? '',
      "player1Status": player1Status ?? '',
      "player2Status": player2Status ?? '',
      "gameValue": gameValue ?? [],
      "isXTurn": isXTurn ?? 'true'
    };
  }

  @override
  String toString() {
    return 'RoomModel(id: $id, entryFee: $entryFee, winningPrize: $winningPrize, drawMatch: $drawMatch, player1: $player1, player2: $player2, gameStatus: $gameStatus, player1Status: $player1Status, player2Status: $player2Status, gameValue: $gameValue, isXTurn: $isXTurn)';
  }
}
