
import 'package:consumir_api/listar_exportaciones_EN.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  
  static String url = "https://exportaciones-ivyq.onrender.com/exportaciones"; //link de mi codigo consumible
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
        print("The insertion failed, please contact the system administrator.");
      }
      
    }catch (e){
      print(e.toString());
    }
  }
}


class ExportacionEN extends StatefulWidget {
  const ExportacionEN({super.key});

  @override
  State<ExportacionEN> createState() => ExportacionStateEN();
}
// ignore: non_constant_identifier_names

TextEditingController producto = TextEditingController();
TextEditingController kilos = TextEditingController();
TextEditingController precioKilos = TextEditingController();
TextEditingController precioActualDolar = TextEditingController();

class ExportacionStateEN extends State<ExportacionEN> {
  static String url_dolar = "https://www.datos.gov.co/resource/mcec-87by.json";
  @override
  void initState() {
    super.initState();
    actualizarValorDolar();
  }

  Future<void> actualizarValorDolar() async {
    try {
      final response = await http.get(Uri.parse(url_dolar));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        if (jsonData.isNotEmpty) {
          final primerObjeto = jsonData[0];
          setState(() {
            precioActualDolar.text = primerObjeto['valor'].toString();
          });
        } else {
          throw Exception('Incorrect response format or empty array');
        }
      } else {
        throw Exception('Error in the API request');
      }
    } catch (error) {
      print('Error fetching the dollar value: $error');
      setState(() {
        precioActualDolar.text = 'Error retrieving the dollar value.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Register export"),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              controller: producto,
              decoration: const InputDecoration(
                hintText: "Product",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Enter producto name',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.name)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.number,
              controller: kilos,
              decoration: const InputDecoration(
                hintText: "Kilograms",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Enter kilograms',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.email)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.number,
              controller: precioKilos,
              decoration: const InputDecoration(
                hintText: "Price per kilo",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Enter price per kilo',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.password)
                ),
            ),
            const SizedBox(height: 20,),
            TextField(
              readOnly: true,
              controller: precioActualDolar,
              decoration: const InputDecoration(
                hintText: "Dollar Price",
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
                  "precio_kilo":precioKilos.text,
                  "precio_dolar_actual":precioActualDolar.text
                  
                };
              
                print(exportacion);
                Http.postExportancion(exportacion).then((value) {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListarExportacion(),
                    ),
                  );
                });


                final route = MaterialPageRoute(
                builder: (context) => const ListarExportacion() );
                Navigator.push(context, route);
                },
                 icon: const Icon(Icons.add_outlined), 
                 label: const Text('Register', style: TextStyle(color: Colors.white)),
                 )
          ],
        ),
      ),
    );
  }
}