import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//https://www.datos.gov.co/resource/vcjz-niiq.json

class Hurtos {
  // ignore: non_constant_identifier_names
  final String armas_medios;
  // ignore: non_constant_identifier_names
  final String municipio;

  Hurtos(
      {required this.armas_medios, required this.municipio});

  factory Hurtos.fromJson(Map<String, dynamic> json) {
    return Hurtos(
        armas_medios: json['armas_medios'],
        municipio: json['municipio'],);
  }
}

Future<List<Hurtos>>fetchPost() async {
  final response = await http.get(Uri.parse("https://www.datos.gov.co/resource/9vha-vh9n.json?departamento=ANTIOQUIA"));
  if(response.statusCode == 200){
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Hurtos.fromJson(json)).toList();

  }else{
    throw Exception('Fallo la carga de datos');
  }
}

class ListarHurtos extends StatefulWidget {
  const ListarHurtos({super.key});

  @override
  State<ListarHurtos> createState() => _ListarHurtosState();
}

class _ListarHurtosState extends State<ListarHurtos> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Listar Hurtos"),
      ),
      body: FutureBuilder(
      future: fetchPost(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else if(snapshot.hasError){ 
          return const Text('Error');
        }
        List<Hurtos> hurtos = snapshot.data as List<Hurtos>;
       
        return ListView.builder(
          itemCount: hurtos.length,
          itemBuilder: (context, index){
           for(int index = 0; index < hurtos.length; index ++){
            if(hurtos[index].municipio == "MEDELLÍN (CT)" && hurtos[index].armas_medios == "ARMA DE FUEGO" ) {
               return ListTile(
              title: Text( hurtos[index].armas_medios),
              subtitle: Text(hurtos[index].municipio),
            );

           } 
   
            }
           
          }
        );
      },
        ),
    );
  }
}