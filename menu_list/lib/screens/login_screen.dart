import 'dart:convert';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void acceder(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login",style: TextStyle(color: Colors.black, fontSize: 30),),
        backgroundColor: Colors.tealAccent,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person, color:  Color.fromARGB(255, 100, 231, 104),),
                  hintText: "Nombre de usuario",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Digitar Usuario',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.username)
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined, color:  Color.fromARGB(255, 100, 231, 104),),
                  suffixIcon: Icon(Icons.password_rounded, color:  Color.fromARGB(255, 100, 231, 104),),
                  hintText: "Contraseña",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Digitar contraseña',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.password)
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
                onPressed: acceder,
                 icon: const Icon(Icons.login_rounded), label: const Text('Acceder', selectionColor: Colors.white,),)
            ],
          ),
        ),
        ),
    );
  }
}