// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    String? name;
    String? address;
    String? city;
    String? id;

    UserModel({
        this.name,
        this.address,
        this.city,
        this.id,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        address: json["address"],
        city: json["city"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "city": city,
        "id": id,
    };
}
