// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'screen_profile_bloc.dart';

class ScreenProfileState extends Equatable {
  String name;
  int age;
  File? img;
  List<UserModel> userModelList;
  ScreenProfileState(
      {this.name = '', this.age = 0, this.img, this.userModelList = const []});
  @override
  List<Object?> get props => [name, age, img, userModelList];

  ScreenProfileState copyWith(
      {String? name, int? age, File? img, List<UserModel>? userModelList}) {
    return ScreenProfileState(
        name: name ?? this.name,
        age: age ?? this.age,
        img: img ?? this.img,
        userModelList: userModelList ?? this.userModelList);
  }
}
