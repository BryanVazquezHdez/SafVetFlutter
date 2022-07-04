// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:safevet/pages/add_pet.dart';
import 'package:safevet/pages/pet_page.dart';

class MyPets extends StatefulWidget {
  MyPets({Key? key}) : super(key: key);

  @override
  State<MyPets> createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        overlayOpacity: 0.4,
        overlayColor: Colors.black,
        spacing: 12,
        spaceBetweenChildren: 12,
        closeManually: false,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add_circle_outline_sharp),
              label: "Añadir mascota",
              backgroundColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddPet()));
              }),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 32, 26, 48),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(16),
        children: [buildQuoteCard()],
      )),
    );
  }

  Widget buildQuoteCard() => Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'items',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
              Text(
                'Eleanor Roosevelt',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}

Future showToast(String message) async {
  await Fluttertoast.cancel();

  Fluttertoast.showToast(msg: message, fontSize: 18);
}
