import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Http {
  static String url = "https://apinodemongo-iox5.onrender.com/api/usuarios"; //link de mi codigo consumible
  static postUsuario(Map usuario) async{
    try{
      final res = await http.post(Uri.parse(url),
      headers:{
        'Content-type': 'application/json',
      },
      body: json.encode(usuario),
      );
       if(res.statusCode == 200){
        var data = jsonDecode(res.body.toString());
        print(data);
      }else{
        print("Falló la inserción contacta con el administrador del sistema");
      }
      
    }catch (e){
      print(e.toString());
    }
  }
}

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => RegistrarState();
}
TextEditingController nombre = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController rol = TextEditingController();
class RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Usuario'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nombre,
              decoration: const InputDecoration(
                hintText: "Nombre de usuario",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar usuario',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.name)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Correo Eléctronico",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar correo',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.email)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Contraseña",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar contraseña',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.password)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: rol,
              decoration: const InputDecoration(
                hintText: "Rol Usuario",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar rol',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.name)
                ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                onPressed: (){
                var usuario ={
                  "nombre":nombre.text,
                  "email":email.text,
                  "password":password.text,
                  "rol":rol.text
                  
                };
              
                print(usuario);
                Http.postUsuario(usuario);
                },
                 icon: const Icon(Icons.add_outlined), 
                 label: const Text('Registrar', selectionColor: Colors.white,),
                 )
          ],
        ),
      ),
    );
  }
}