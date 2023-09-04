import 'dart:convert';

List<Vanila> vanilaFromJson(String str) =>
    List<Vanila>.from(json.decode(str).map((x) => Vanila.fromJson(x)));

String vanilaToJson(List<Vanila> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vanila {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Vanila({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Vanila.fromJson(Map<String, dynamic> json) => Vanila(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
