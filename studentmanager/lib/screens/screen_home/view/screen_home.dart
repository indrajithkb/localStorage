import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentmanager/screens/screen_profile/bloc/screen_profile_bloc.dart';
import 'package:studentmanager/screens/screen_profile/view/screen_profile.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                context.read<ScreenProfileBloc>().add(ResetTextAndImage());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screenprofile(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<ScreenProfileBloc, ScreenProfileState>(
        builder: (context, state) {
          final dataList = state.userModelList;
          return dataList.isEmpty
              ? const Center(
                  child: Text('No details added'),
                )
              : ListView.builder(
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
                      trailing: Container(
                        width: 100,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
