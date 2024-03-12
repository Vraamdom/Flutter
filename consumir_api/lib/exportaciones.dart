import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  static String url = "https://apinodemongo-iox5.onrender.com/api/usuarios"; //link de mi codigo consumible
  static postExportancion(Map exportacion) async{
    try{
      final res = await http.post(Uri.parse(url),
      headers:{
        'Content-type': 'application/json',
      },
      body: json.encode(exportacion),
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

class Exportacion extends StatefulWidget {
  const Exportacion({super.key});

  @override
  State<Exportacion> createState() => ExportacionState();
}

TextEditingController producto = TextEditingController();
TextEditingController kilos = TextEditingController();
TextEditingController precioKilos = TextEditingController();
TextEditingController precioActualDolar = TextEditingController();

class ExportacionState extends State<Exportacion> {
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
              controller: producto,
              decoration: const InputDecoration(
                hintText: "Producto",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar nombre del producto',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.name)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: kilos,
              decoration: const InputDecoration(
                hintText: "Kilos",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar kilos',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.email)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: precioKilos,
              decoration: const InputDecoration(
                hintText: "Precio kilos",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar precio de los kilos',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.password)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              readOnly: true,
              controller: precioActualDolar,
              decoration: const InputDecoration(
                hintText: "Precio Dolar",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                onPressed: (){
                var exportacion ={
                  "producto":producto.text,
                  "kilos":kilos.text,
                  "precioKilos":precioKilos.text,
                  "precioActualDolar":precioActualDolar.text
                  
                };
              
                print(exportacion);
                Http.postExportancion(exportacion);
                },
                 icon: const Icon(Icons.add_outlined), 
                 label: const Text('Registrar', style: TextStyle(color: Colors.white)),
                 )
          ],
        ),
      ),
    );
  }
}