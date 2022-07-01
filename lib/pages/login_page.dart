// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safevet/pages/recover_page.dart';
import 'package:safevet/pages/register_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
//controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 26, 48),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/SafeVet_Logo.png',
                  height: 250,
                  width: 250,
                ),

                // Hola de nuevo!!
                Text(
                  "¡Hola de nuevo! 🐶",
                  style: GoogleFonts.roboto(fontSize: 36, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bienvenido de vuelta 🤗",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),

                //Textfield correo
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
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextField(
                        controller: _emailController,
                        cursorColor: Color.fromARGB(255, 13, 245, 227),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 85, 73, 115),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.alternate_email,
                            ),
                            hintText: 'Introduce tu correo electrónico'),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                //Textfield contraseña
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
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextField(
                        controller: _passwordController,
                        cursorColor: Color.fromARGB(255, 13, 245, 227),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 85, 73, 115),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.password),
                            hintText: 'Introduce tu contraseña'),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextButton(
                          child: Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 245, 227)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecoverPage()));
                          }),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                //boton login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: SizedBox(
                          height: 70,
                          width: 250,
                          child: CupertinoButton(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 32, 26, 48)),
                              ),
                              color: Color.fromARGB(255, 13, 245, 227),
                              onPressed: () {
                                signIn();
                              }),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿No estás registrado?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 127, 126, 129)),
                    ),
                    TextButton(
                        child: Text(
                          "¡Regístrate aquí!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 13, 245, 227)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
