// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'screen_profile_bloc.dart';

@JsonSerializable()
class ScreenProfileState extends Equatable {
  String name;
  int age;
  int selectedUserIndex;
  String? img;
  // File? img;
  List<UserModel> userModelList;
  ScreenProfileState(
      {this.name = '',
      this.age = 0,
      this.selectedUserIndex = -1,
      this.img,
      this.userModelList = const []});
  // Named constructor to create an instance from a map
  factory ScreenProfileState.fromJson(Map<String, dynamic> json) =>
      _$ScreenProfileStateFromJson(json);

  // Method to convert the state back to a map
  // Map<String, dynamic> toJson() => _$ScreenProfileStateToJson(this);
  Map<String, dynamic> toJson() {
    return _$ScreenProfileStateToJson(this);
  }

  @override
  List<Object?> get props => [
        name, age, selectedUserIndex,
         img,
        userModelList
      ];

  ScreenProfileState copyWith(
      {String? name,
      int? age,
     String? img,
      int? selectedUserIndex,
      List<UserModel>? userModelList}) {
    return ScreenProfileState(
        name: name ?? this.name,
        age: age ?? this.age,
        img: img ?? this.img,
        selectedUserIndex: selectedUserIndex ?? this.selectedUserIndex,
        userModelList: userModelList ?? this.userModelList);
  }
}
