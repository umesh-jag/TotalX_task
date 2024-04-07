// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/models/provider.dart';
import 'package:totalx_task/models/usermodel.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _image;

  void selectImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Check if the error is due to an already active image picker
      if (e.toString().contains('already_active')) {
        // Display a message to the user indicating that they need to wait
        // for the previous image picking process to finish.
        print('Image picker is already active. Please wait.');
      } else {
        // Handle other types of errors
        print('Error picking image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Add A New User',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 64,
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path)) as ImageProvider<Object>
                        : const AssetImage("assets/image/pers.png"),
                  ),
                  Positioned(
                    width: 50,
                    bottom: -10,
                    right: 40,
                    top: 70,
                    child: IconButton(
                      focusColor: Colors.white,
                      tooltip: 'Pick Image',
                      icon: const Icon(
                        size: 30,
                        Icons.camera_alt,
                      ),
                      onPressed: selectImage,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Name",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Age",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(96, 120, 119, 119),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    width: 120,
                    height: 35,
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(96, 120, 119, 119),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 120,
                    height: 35,
                    child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        final String name = _nameController.text;
                        final int age = int.tryParse(_ageController.text) ?? 0;
                        final File image = File(_image!.path);

                        final user =
                            User(name: name, age: age, imageFile: image);

                        Provider.of<UserProvider>(context, listen: false)
                            .addUser(user);

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
