import 'dart:convert';
import 'package:consumir_api/editar_exportacion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exportacion {
  // ignore: non_constant_identifier_names
  final int id_p;
  // ignore: non_constant_identifier_names
  final String producto;

  final int kilos;
  
  // ignore: non_constant_identifier_names
  final int precio_kilo;

  // ignore: non_constant_identifier_names
  final double precio_dolar_actual;

  Exportacion(
      // ignore: non_constant_identifier_names
      {required this.id_p, required this.producto, required this.kilos, required this.precio_kilo, required this.precio_dolar_actual});

  factory Exportacion.fromJson(Map<String, dynamic> json) {
    return Exportacion(
        id_p: json['id_p'],
        producto: json['producto'],
        kilos: json['kilos'],
        precio_kilo: json['precio_kilo'],
        precio_dolar_actual: json['precio_dolar_actual'],);
  }
}

Future<List<Exportacion>>fetchPost() async {
  final response = await http.get(Uri.parse("https://exportaciones-api.onrender.com/exportaciones"));
  if(response.statusCode == 200){
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> exportacionesJson = jsonData['msg'];
    return exportacionesJson.map((json) => Exportacion.fromJson(json)).toList();
  }else{
    throw Exception('Fallo la carga de las exportaciones');
  }
}

class ListarExportacion extends StatefulWidget {
  const ListarExportacion({super.key});

  @override
  State<ListarExportacion> createState() => _ListarExportacionState();
}

class _ListarExportacionState extends State<ListarExportacion> {
 late List<Exportacion> exportaciones; // Declaración de la lista

  @override
  void initState() {
    super.initState();
    // Inicialización de la lista en el initState
    exportaciones = [];
  }
    void editarExportacion(BuildContext context, Exportacion exportacion) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarExportacion(exportacion: exportacion),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void eliminarExportacion(int id_p) async {
  final response = await http.delete(
    Uri.parse("https://exportaciones-api.onrender.com/exportaciones?$id_p"),
  );
  print(response);
  if (response.statusCode == 200) {
  }
}

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Listar exportaciones"),
      ),
      body: FutureBuilder(
      future: fetchPost(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else if(snapshot.hasError){ 
          return Text('Error${snapshot.error}');
        }
        List<Exportacion> exportaciones = snapshot.data as List<Exportacion>;
        return ListView.builder(
          itemCount: exportaciones.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(exportaciones[index].producto),   
             subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exportaciones[index].id_p.toString()),
                      Text(exportaciones[index].kilos.toString()),
                      Text(exportaciones[index].precio_kilo.toString()),
                      Text(exportaciones[index].precio_dolar_actual.toString()),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          editarExportacion(context, exportaciones[index]);
                          // Implementar la lógica para editar aquí
                          print('Editar');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                         eliminarExportacion(exportaciones[index].id_p);
                         setState(() {
                            
                         });
                          // Implementar la lógica para eliminar aquí
                          print('Eliminar');
                        },
                      ),
                    ],
                  ),

            );
          }
        );
      },
        ),
    );
}
}