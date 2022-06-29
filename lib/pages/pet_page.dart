// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safevet/pages/profile_page.dart';

class PetPage extends StatelessWidget {
  final CardItem item;

  const PetPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 32, 26, 48),
        appBar: CupertinoNavigationBar(
          middle: Text("Datos de " + item.title,
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
                  item.urlImage,
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
              item.title,
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              item.subtitle,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal),
            )
          ]),
        ),
      );
}
