// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPet extends StatefulWidget {
  AddPet({Key? key}) : super(key: key);

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download link: ' + urlDownload);

    setState(() {
      uploadTask = ref.putFile(file);
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  final items = ['Canino', 'Felino', 'Ave', 'Peces', 'Hámster', 'Otro'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Theme(
      data: themeData.copyWith(
          inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
        prefixIconColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return Color.fromARGB(255, 13, 245, 227);
          }
          if (states.contains(MaterialState.error)) {
            return Colors.red;
          }
          return Color.fromARGB(255, 32, 26, 48);
        }),
      )),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 32, 26, 48),
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded,
                            color: Color.fromARGB(255, 13, 245, 227)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SafeArea(
                child: Center(
                    child: Column(
              children: [
                Image.asset(
                  'assets/images/dog.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Registra a tu mascota",
                  style: GoogleFonts.roboto(fontSize: 36, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                //
                //Nombre de mascota
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 73, 115),
                        border: Border.all(
                          color: Color.fromARGB(255, 85, 73, 115),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 85, 73, 115),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.pets_outlined),
                            hintText: 'Nombre de mascota'),
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(
                  height: 10,
                ),
                //

                //
                // Edad aproximada
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 73, 115),
                        border: Border.all(
                          color: Color.fromARGB(255, 85, 73, 115),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 85, 73, 115),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.onetwothree_outlined),
                            hintText: 'Edad aproximada'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //Tipo de mascota
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 73, 115),
                        border: Border.all(
                          color: Color.fromARGB(255, 85, 73, 115),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: Center(
                        child: DropdownButtonFormField<String>(
                          enableFeedback: false,
                          iconEnabledColor: Color.fromARGB(255, 47, 40, 63),
                          autofocus: false,
                          dropdownColor: Color.fromARGB(255, 85, 73, 115),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 85, 73, 115))),
                            hoverColor: Colors.black,
                            prefixIcon: Icon(Icons.pets),
                          ),
                          hint: Text('Selecciona tu tipo de mascota'),
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //foto de mascota
                SizedBox(
                  width: 365,
                  child: CupertinoButton(
                    color: Color.fromARGB(255, 85, 73, 115),
                    child: const Text("Seleccionar foto de mascota"),
                    onPressed: selectFile,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      if (pickedFile != null)
                        Expanded(
                            child: Image.file(
                          File(pickedFile!.path!),
                          fit: BoxFit.cover,
                        )),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 365,
                  child: CupertinoButton(
                    color: Color.fromARGB(255, 85, 73, 115),
                    child: const Text("Subir foto"),
                    onPressed: uploadFile,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildProgress(),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(
                      "Registrar mascota",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 32, 26, 48)),
                    ),
                    onPressed: () {},
                    color: Color.fromARGB(255, 13, 245, 227)),
              ],
            )))
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: GoogleFonts.poppins(),
      ));

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text('${(100 * progress).roundToDouble()}%'),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );
}
