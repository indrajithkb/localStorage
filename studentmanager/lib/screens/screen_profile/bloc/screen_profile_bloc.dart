import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:studentmanager/model/user_model.dart';

part 'screen_profile_event.dart';
part 'screen_profile_state.dart';
part 'screen_profile_bloc.g.dart';

class ScreenProfileBloc
    extends HydratedBloc<ScreenProfileEvent, ScreenProfileState> {
  ScreenProfileBloc() : super(ScreenProfileState()) {
    on<FetchName>(_onFetchNameEvent);
    on<FetchAge>(_onFetchAgeEvent);
    // on<FetchImg>(_onFetchImgEvent);
    on<FetchUserModelList>(_onFetchUserModelListEvent);
    on<ResetTextAndImage>(_onResetTextAndImage);
    on<DeleteUser>(_onDeleteUserEvent);
    on<EditUser>(_onEditUserEvent);
    on<UserIndex>(_onUserIndexEvent);
  }

  FutureOr<void> _onFetchNameEvent(
      FetchName event, Emitter<ScreenProfileState> emit) async {
    emit(state.copyWith(name: event.name));
    print(event.name);
  }

  FutureOr<void> _onFetchAgeEvent(
      FetchAge event, Emitter<ScreenProfileState> emit) {
    emit(state.copyWith(
      age: event.age,
    ));
    print(event.age);
  }

  // FutureOr<void> _onFetchImgEvent(
  //     FetchImg event, Emitter<ScreenProfileState> emit) {
  //   emit(state.copyWith(
  //     img: event.img,
  //   ));
  //   print(event.img);
  // }

  FutureOr<void> _onFetchUserModelListEvent(
    FetchUserModelList event,
    Emitter<ScreenProfileState> emit,
  ) {
    List<UserModel> updatedUserModelList = List.from(state.userModelList);
    updatedUserModelList.add(
      UserModel(
        name: state.name, age: state.age,
        //  img: state.imgikv
      ),
    );
    // print(updatedUserModelList[0].name);
    emit(state.copyWith(userModelList: updatedUserModelList));
  }

  FutureOr<void> _onResetTextAndImage(
      ResetTextAndImage event, Emitter<ScreenProfileState> emit) async {
    emit(state.copyWith(name: '', age: null, img: null));
  }

  FutureOr<void> _onDeleteUserEvent(
      DeleteUser event, Emitter<ScreenProfileState> emit) {
    List<UserModel> updatedUserModelList = List.from(state.userModelList);
    updatedUserModelList.removeAt(event.idx);
    emit(state.copyWith(userModelList: updatedUserModelList));
  }

  FutureOr<void> _onEditUserEvent(
      EditUser event, Emitter<ScreenProfileState> emit) async {
    List<UserModel> updatedUserModelList = List.from(state.userModelList);

    if (event.idx >= 0 && event.idx < updatedUserModelList.length) {
      // Update the user data based on the provided index (idx)
      updatedUserModelList[event.idx] = UserModel(
        name: event.name,
        age: event.age,
        // Update other properties as needed
      );
    }

    emit(state.copyWith(userModelList: updatedUserModelList));
  }

  @override
  ScreenProfileState? fromJson(Map<String, dynamic> json) {
    print(json);
    return ScreenProfileState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ScreenProfileState state) {
    print(state.toJson());
    return state.toJson();
  }

  FutureOr<void> _onUserIndexEvent(
      UserIndex event, Emitter<ScreenProfileState> emit) {
    emit(state.copyWith(selectedUserIndex: event.ind));
  }
}
