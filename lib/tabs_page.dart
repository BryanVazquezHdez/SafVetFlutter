// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:safevet/pages/home_page.dart';
import 'package:safevet/pages/login_page.dart';
import 'package:safevet/pages/mypets_page.dart';
import 'package:safevet/pages/profile_page.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:safevet/pages/register_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _paginaActual = 0;

   List<Widget> _paginas = [HomePage(), MyPets(), RegisterPage(), ProfilePage()];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              onTabChange: (index) {
                setState(() {
                  _paginaActual = index;
                });
              },
              selectedIndex: _paginaActual,
              //
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              color: Color.fromARGB(255, 255, 255, 255),
              activeColor: Color.fromARGB(255, 255, 255, 255),
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.pets, text: 'Mis Mascotas'),
                GButton(icon: Icons.calendar_month_outlined, text: 'Citas'),
                GButton(icon: Icons.person, text: 'Perfil')
              ]),
        ),
      ),
    );
  }
}
