import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:studentmanager/model/user_model.dart';

part 'screen_profile_event.dart';
part 'screen_profile_state.dart';

class ScreenProfileBloc extends Bloc<ScreenProfileEvent, ScreenProfileState> {
  ScreenProfileBloc() : super(ScreenProfileState()) {
    on<FetchName>(_onFetchNameEvent);
    on<FetchAge>(_onFetchAgeEvent);
    on<FetchImg>(_onFetchImgEvent);
    on<FetchUserModelList>(_onFetchUserModelListEvent);
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

  FutureOr<void> _onFetchImgEvent(
      FetchImg event, Emitter<ScreenProfileState> emit) {
    emit(state.copyWith(
      img: event.img,
    ));
    print(event.img);
  }

  FutureOr<void> _onFetchUserModelListEvent(
    FetchUserModelList event,
    Emitter<ScreenProfileState> emit,
  ) {
    List<UserModel> updatedUserModelList = List.from(state.userModelList);
    updatedUserModelList.add(
      UserModel(name: state.name, age: state.age, img: state.img),
    );
    // print(updatedUserModelList[0].name);
    emit(state.copyWith(userModelList: updatedUserModelList));
  }
}
