import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safevet/profile_page.dart';

class PetPage extends StatelessWidget {
  final CardItem item;

  const PetPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Datos de " + item.title)),
        body: Column(children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              item.urlImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.title,
            style: GoogleFonts.poppins(
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          Text(
            item.subtitle,
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.normal),
          )
        ]),
      );
}
