// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:path/path.dart';
import 'package:safevet/pages/pet_page.dart';

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;

  const CardItem(
      {required this.urlImage, required this.title, required this.subtitle});
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<CardItem> items = [
    CardItem(
        urlImage:
            'https://static.wikia.nocookie.net/razasdeperros4226/images/e/e3/Beagle.jpg/revision/latest/scale-to-width-down/1000?cb=20170320235525&path-prefix=es',
        title: 'Snoopy',
        subtitle: 'Raza: Beagle'),
    CardItem(
        urlImage:
            'https://upload.wikimedia.org/wikipedia/commons/b/b9/French_poodle_.jpg',
        title: 'Lady',
        subtitle: 'Raza: French Poodle'),
    CardItem(
        urlImage:
            'https://www.zooportraits.com/wp-content/uploads/2018/06/shutterstock_528653692.jpg',
        title: 'Niña',
        subtitle: 'Raza: Basset Hound'),
    CardItem(
        urlImage:
            'https://heraldodemexico.com.mx/wp-content/uploads/2020/06/french-1-1200x900.jpg',
        title: 'Peque',
        subtitle: 'Raza: French Poodle'),
    CardItem(
        urlImage:
            'https://as1.ftcdn.net/v2/jpg/01/19/49/48/1000_F_119494850_Pj5FGvunBykLhgnke2iUMncePCjdyNlD.jpg',
        title: 'Lovly',
        subtitle: 'Raza: French Poodle'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget buildCard({
      required CardItem item,
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
                                    builder: (context) => PetPage(
                                          item: item,
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
                  item.subtitle,
                  style: GoogleFonts.poppins(color: Colors.white),
                )
              ],
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 32, 26, 48),
      body: Column(
        children: [
          Center(
            child: SafeArea(
                //profile picture
                child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )
                    ]),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.red,
                  backgroundImage: ExactAssetImage('assets/images/profile.png'),
                ),
              ),
            )),
          ),

          //Profile Title
          Text("Bryan Vazquez",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          Text("Miembro desde hace 2 años",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color.fromARGB(255, 164, 164, 164),
              )),
          SizedBox(
            height: 5,
          ),

          //botones
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(
                      "Agendar cita médica",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 32, 26, 48)),
                    ),
                    onPressed: () {},
                    color: Color.fromARGB(255, 13, 245, 227)),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                    borderRadius: BorderRadius.circular(50),
                    child: Text("Agendar cita estética",
                        style: TextStyle(fontSize: 15)),
                    onPressed: () {},
                    color: Color.fromARGB(255, 40, 40, 40))
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Text("Mis mascotas",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),

          SizedBox(
            height: 20,
          ),

          Container(
            height: 256,
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, _) => SizedBox(
                width: 12,
              ),
              itemBuilder: (context, index) => buildCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
