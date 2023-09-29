// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'screen_profile_bloc.dart';

@immutable
class ScreenProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchName extends ScreenProfileEvent {
  String name;
  FetchName({
    required this.name,
  });
}

class FetchAge extends ScreenProfileEvent {
  int age;
  FetchAge({
    required this.age,
  });
}

class FetchImg extends ScreenProfileEvent {
  String img;
  FetchImg({required this.img});
}

class FetchUserModelList extends ScreenProfileEvent {
  // List<UserModel>updatedList;
  // FetchUserModelList({required this.updatedList});
}

class ResetTextAndImage extends ScreenProfileEvent {}

class DeleteUser extends ScreenProfileEvent {
  int idx;
  DeleteUser({required this.idx});
}

class EditUser extends ScreenProfileEvent {
  int idx;
  String name;
  int age;
  String img;
  EditUser({required this.idx, required this.name, required this.age,required this.img});
}

class UserIndex extends ScreenProfileEvent {
  int ind;
  UserIndex({required this.ind});
}
