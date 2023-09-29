import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentmanager/common_widgets/common_textformfield.dart';
import 'package:studentmanager/model/user_model.dart';
import 'package:studentmanager/screens/screen_home/view/screen_home.dart';
import 'package:studentmanager/screens/screen_profile/bloc/screen_profile_bloc.dart';

class Screenprofile extends StatefulWidget {
  Screenprofile({required this.isEdited, super.key});
  bool isEdited;
  @override
  State<Screenprofile> createState() => _ScreenprofileState();
}

class _ScreenprofileState extends State<Screenprofile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // File? _pickedImage;

  // Future<void> _pickImage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.camera);

  //   if (pickedImage != null) {
  //     _pickedImage = File(pickedImage.path);
  //     context.read<ScreenProfileBloc>().add(FetchImg(img: _pickedImage!));
  //     // setState(() {
  //     //   _pickedImage = File(pickedImage.path);
  //     // });
  //   }
  // }

  // var pic;
  // var photo;
  // Future getImage() async {
  //   XFile? _image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   return _image!.path;
  // }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.isEdited == true ? true : false,
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
                    // CircleAvatar(
                    //     radius: 52,
                    //     backgroundColor: Colors.transparent,
                    //     child: ClipOval(
                    //         child: photo == null
                    //             ? Image.asset(
                    //                 'assets/image/defaultpropic.jpeg',
                    //                 fit: BoxFit.cover,
                    //                 height: 135,
                    //                 width: 135,
                    //               )
                    //             : Image.file(
                    //                 File(photo),
                    //                 fit: BoxFit.cover,
                    //                 height: 135,
                    //                 width: 135,
                    //               ))),

                    // SizedBox(height: 5),
                    // ElevatedButton.icon(
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //           Color.fromARGB(255, 5, 9, 10)),
                    //     ),
                    //     icon: Icon(
                    //       Icons.image,
                    //       color: Color.fromARGB(255, 32, 57, 61),
                    //       size: 10.0,
                    //     ),
                    //     label: Text(
                    //       'Image',
                    //       style: TextStyle(color: Colors.blueGrey),
                    //     ),
                    //     onPressed: () async {
                    //       pic = await getImage();
                    //       setState(() {
                    //         photo = pic;
                    //       });

                    //     }),
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: 100,
                    //       width: 100,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         image: _pickedImage == null
                    //             ? const DecorationImage(
                    //                 image: AssetImage(
                    //                     'assets/image/defaultpropic.jpeg'),
                    //                 fit: BoxFit.cover)
                    //             : DecorationImage(
                    //                 image: FileImage(state.img!),
                    //                 fit: BoxFit.cover),
                    //         border: Border.all(
                    //           color:
                    //               Colors.black, // Set the color of the border
                    //           width: .5, // Set the width of the border
                    //         ),
                    //       ),
                    //     ),
                    //     Positioned(
                    //         left: 70,
                    //         bottom: 5,
                    //         child: InkWell(
                    //             onTap: () {
                    //               _pickImage(ImageSource.camera);
                    //             },
                    //             child: const Icon(Icons.add_a_photo)))
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    commonTextField(
                      ctlr: nameController,
                      text:
                          // widget.isEdited == true
                          //     ? state.name.toString()
                          //     :
                          'Name',
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
                      text:
                          //  widget.isEdited == true
                          //     ? state.age.toString()
                          //     :
                          'Age',
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
                          if (onValidate()) {
                            if (widget.isEdited == true) {
                              if (state.selectedUserIndex != -1) {
                                context.read<ScreenProfileBloc>().add(EditUser(
                                    idx: state.selectedUserIndex,
                                    name: state.name,
                                    age: state.age));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenHome()));
                              }
                            } else {
                              context
                                  .read<ScreenProfileBloc>()
                                  .add(FetchUserModelList());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenHome()));
                            }
                          }
                          // else if (onValidate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(content: Text('add image')));
                          // }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('add details')));
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
