import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentmanager/model/user_model.dart';
import 'package:studentmanager/screens/screen_profile/bloc/screen_profile_bloc.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ScreenProfileBloc, ScreenProfileState>(
        builder: (context, state) {
          final dataList = state.userModelList;
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(dataList[index].img!),
                        fit: BoxFit.cover),
                  ),
                ),
                title: Text(dataList[index].name.toString()),
                subtitle: Text(dataList[index].age.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
