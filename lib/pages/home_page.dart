// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safevet/pages/appointments.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher_string.dart';

class CardItem2 {
  final String title;
  final String subtitle;
  final String date;
  final String hour;
  final String urlImage;

  const CardItem2({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.hour,
    required this.urlImage,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final isDialOpen = ValueNotifier(false);
  List<CardItem2> items = [
    CardItem2(
      title: 'Snoopy',
      subtitle: 'Raza: Beagle',
      date: '10/10/2022',
      hour: '16;30',
      urlImage:
          'https://www.weare-family.com/petfanmx/wp-content/uploads/sites/10/2020/11/medico-veterinario-revision.jpg',
    ),
    CardItem2(
        title: 'Lady',
        subtitle: 'Raza: French Poodle',
        date: '10/10/2022',
        hour: '16;30',
        urlImage:
            'https://petslife.com.mx/wp-content/uploads/2018/02/N1-1.jpg'),
    CardItem2(
      title: 'Peque',
      subtitle: 'Raza: Frech Poodle',
      date: '10/10/2022',
      hour: '16;30',
      urlImage:
          'https://www.weare-family.com/petfanmx/wp-content/uploads/sites/10/2020/11/medico-veterinario-revision.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    Widget buildCard({
      required CardItem2 item,
    }) =>
        Container(
            width: 200,
            child: Column(
              children: [
                Expanded(
                    child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: Ink.image(
                          image: NetworkImage(item.urlImage),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppointPage(
                                          item2: item,
                                        ))),
                          ),
                        ),
                      )),
                )),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  item.title,
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Fecha de cita: ' + item.date,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ));

    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
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
                child: Icon(Icons.medical_services_outlined),
                label: "Agendar cita médica",
                backgroundColor: Colors.white,
                onTap: () => showToast('Selected medical appoint')),
            SpeedDialChild(
                child: Icon(Icons.shower),
                label: "Agendar cita estética",
                backgroundColor: Color.fromARGB(255, 218, 204, 14),
                onTap: () => showToast('Selected stetic appoint')),
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 32, 26, 48),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "¡Hola!\nBienvenido de vuelta 🙋🏻‍♂️",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("Aquí tienes un resumen",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text("Citas 🗓",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                height: 256,
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      buildCard(item: items[index]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Recomendaciones ✍🏻",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  borderRadius: BorderRadius.circular(50),
                  child: Text(
                    "¡Has clic para más recomendaciones!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 32, 26, 48)),
                  ),
                  onPressed: () {
                    launchUrlString('https://www.cuidandotumascota.com/');
                  },
                  color: Color.fromARGB(255, 13, 245, 227)),
              //CITAS
            ]),
          ),
        )),
      ),
    );
  }
}

Future showToast(String message) async {
  await Fluttertoast.cancel();

  Fluttertoast.showToast(msg: message, fontSize: 18);
}
