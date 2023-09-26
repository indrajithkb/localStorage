import 'dart:io';

class UserModel {
  String? name;
  int? age;
  File? img;

  UserModel({this.name, this.age, this.img});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['img'] = this.img;
    return data;
  }
}
