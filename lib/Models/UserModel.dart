class UserModel {
  String? id;
  String? name;
  String? email;
  String? image;
  String? totalWins;
  String? role;
  String? totalCoins;
  String? yourTurn;

  UserModel(
      {this.role,
      this.id,
      this.name,
      this.email,
      this.image,
      this.totalWins,
      this.totalCoins,
      this.yourTurn});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    image = json["image"];
    totalWins = json["totalWins"];
    role = json["role"];
    totalCoins = json["totalCoins"];
    yourTurn = json["yourTurn"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? '',
      "name": name ?? '',
      "email": email ?? '',
      "image": image ?? '',
      "role": role ?? '',
      "totalWins": totalWins ?? '0',
      "totalCoins": totalCoins ?? '0',
      "yourTurn": yourTurn ?? ''
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, image: $image, role: $role, totalWins: $totalWins, totalCoins: $totalCoins, yourTurn: $yourTurn)';
  }
}
