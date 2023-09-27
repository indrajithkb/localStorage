import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentmanager/common_widgets/common_textformfield.dart';
import 'package:studentmanager/model/user_model.dart';
import 'package:studentmanager/screens/screen_home/view/screen_home.dart';
import 'package:studentmanager/screens/screen_profile/bloc/screen_profile_bloc.dart';

class Screenprofile extends StatefulWidget {
  const Screenprofile({super.key});

  @override
  State<Screenprofile> createState() => _ScreenprofileState();
}

class _ScreenprofileState extends State<Screenprofile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      _pickedImage = File(pickedImage.path);
      context.read<ScreenProfileBloc>().add(FetchImg(img: _pickedImage!));
      // setState(() {
      //   _pickedImage = File(pickedImage.path);
      // });
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  // List<UserModel> userModelList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: _formKey,
            child: BlocBuilder<ScreenProfileBloc, ScreenProfileState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: _pickedImage == null
                                ? const DecorationImage(
                                    image: AssetImage(
                                        'assets/image/defaultpropic.jpeg'),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: FileImage(state.img!),
                                    fit: BoxFit.cover),
                            border: Border.all(
                              color:
                                  Colors.black, // Set the color of the border
                              width: .5, // Set the width of the border
                            ),
                          ),
                        ),
                        Positioned(
                            left: 70,
                            bottom: 5,
                            child: InkWell(
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                },
                                child: const Icon(Icons.add_a_photo)))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    commonTextField(
                      ctlr: nameController,
                      text: 'Name',
                      isObscure: false,
                      isPasswordType: false,
                      onChanged: (val) async {
                        context
                            .read<ScreenProfileBloc>()
                            .add(FetchName(name: val));
                      },
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    commonTextField(
                      ctlr: ageController,
                      text: 'Age',
                      isObscure: false,
                      isPasswordType: false,
                      onChanged: (val) {
                        int? age = int.tryParse(val);
                        if (age != null) {
                          context
                              .read<ScreenProfileBloc>()
                              .add(FetchAge(age: age));
                        }
                      },
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (onValidate() && _pickedImage != null) {
                            context
                                .read<ScreenProfileBloc>()
                                .add(FetchUserModelList());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ScreenHome()));
                          } else if (onValidate() && _pickedImage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('add image')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('add age')));
                            print('not validated');
                          }
                        },
                        child: const Text('Submit'))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool onValidate() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
