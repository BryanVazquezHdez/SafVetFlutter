// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  // final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controladores de texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _cellphoneController = TextEditingController();
  final _firstnameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _cellphoneController.dispose();
    _firstnameController.dispose();
    super.dispose();
  }

//autenticar usuario
  Future signUp() async {
    if (passwordConfirmed()) {
      //crear usuario
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      addUserDetails(
          _firstnameController.text.trim(),
          int.parse(_cellphoneController.text.trim()),
          _emailController.text.trim());
    }
  }

  Future addUserDetails(String firstName, int cellphone, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstName,
      'cellphone': cellphone,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 32, 26, 48),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                SafeArea(
                  child: Row(
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
                ),
                SafeArea(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        "¡Regístrate!",
                        style: GoogleFonts.roboto(
                            fontSize: 36, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      //textfield correo
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
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 85, 73, 115),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.alternate_email),
                                  hintText: 'Introduce tu correo electrónico'),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
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
                              controller: _confirmpasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 85, 73, 115),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.password),
                                  hintText: 'Repite tu contraseña'),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Textfield tu telefono
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
                              controller: _cellphoneController,
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 85, 73, 115),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: 'Introduce tu número celular'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //texfield nombre
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
                              controller: _firstnameController,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 85, 73, 115),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.abc),
                                  hintText: 'Introduce tu nombre'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //terminos de uso y condición
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Al registrarte, estás de acuerdo con los terminos \nde uso y condición",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //Botón de registrar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap: signUp,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 13, 245, 227),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text("Continuar",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 32, 26, 48),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
