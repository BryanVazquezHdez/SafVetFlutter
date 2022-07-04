// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({Key? key}) : super(key: key);

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  '¡El link para recuperar contraseña ha sido enviado! Checa tu correo'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 32, 26, 48),
      body: Column(
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
                "assets/images/cat.png",
                height: 150,
                width: 150,
                color: Colors.white,
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: GoogleFonts.roboto(fontSize: 33, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                child: Text(
                  "No te preocupes, suele pasar. Por favor, introduce tu correo asociado a tu cuenta. ",
                  style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
                ),
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
                height: 20,
              ),

              //Botón de
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 245, 227),
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    height: 15,
                    child: Center(
                        child: MaterialButton(
                            onPressed: passwordReset,
                            child: Text(
                              "Enviar",
                              style: TextStyle(fontSize: 15),
                            ))),
                  ),
                ),
              ),
            ],
          )))
        ],
      ),
    );
  }
}
