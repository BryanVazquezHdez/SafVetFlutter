// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safevet/pages/home_page.dart';

class AppointPage extends StatelessWidget {
  final CardItem2 item2;

  const AppointPage({
    Key? key,
    required this.item2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 32, 26, 48),
        appBar: CupertinoNavigationBar(
          middle: Text("Cita de " + item2.title,
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: Color.fromARGB(255, 36, 57, 178),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.network(
                  item2.urlImage,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              item2.title,
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              item2.subtitle,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal),
            ),
            Text(
              'Fecha de cita: ' + item2.date,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal),
            ),
            Text(
              'Hora de cita: ' + item2.hour,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal),
            ),
          ]),
        ),
      );
}
