import 'dart:convert';
import 'package:consumir_api/editar_exportacion_EN.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExportacionEN {
  final String id;
  final String producto;
  final int kilos;
  final int precio_kilo;
  final double precio_dolar_actual;

  ExportacionEN({
    required this.id,
    required this.producto,
    required this.kilos,
    required this.precio_kilo,
    required this.precio_dolar_actual,
  });

  factory ExportacionEN.fromJson(Map<String, dynamic> json) {
    return ExportacionEN(
      id: json['_id'],
      producto: json['producto'],
      kilos: json['kilos'],
      precio_kilo: json['precio_kilo'],
      precio_dolar_actual: json['precio_dolar_actual'],
    );
  }
}

Future<List<ExportacionEN>> fetchPost() async {
  final response = await http.get(
      Uri.parse("https://exportaciones-ivyq.onrender.com/exportaciones"));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> exportacionesJson = jsonData['msg'];
    return exportacionesJson.map((json) => ExportacionEN.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load exports');
  }
}

class ListarExportacion extends StatefulWidget {
  const ListarExportacion({Key? key}) : super(key: key);

  @override
  State<ListarExportacion> createState() => _ListarExportacionState();
}

class _ListarExportacionState extends State<ListarExportacion> {
  late List<ExportacionEN> exportaciones;

  @override
  void initState() {
    super.initState();
    exportaciones = [];
  }

 void editarExportacion(BuildContext context, ExportacionEN exportacion) async {
  // Navegar a la pantalla de edición y esperar el resultado
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditarExportacionEN(exportacion: exportacion),
    ),
  );

  // Verificar si se realizó la edición
  if (result != null && result is bool && result) {
    // Actualizar la lista de exportaciones
    setState(() {
      // Encuentra y reemplaza la exportación editada en la lista de exportaciones
      int index = exportaciones.indexWhere((e) => e.id == exportacion.id);
      if (index != -1) {
        exportaciones[index] = exportacion;
      }
    });
  }
}


  Future<void> eliminarExportacion(String id) async {
    final response = await http.delete(
      Uri.parse("https://exportaciones-ivyq.onrender.com/exportaciones/$id"),
    );
    if (response.statusCode == 200) {
      // Eliminación exitosa
      print('Exports deleted successfully');
      setState(() {
      exportaciones.removeWhere((e) => e.id == id);
      });
    } else {
      // Error al eliminar
      print('Error deleting the export: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List exports"),
      ),
      body: FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          List<ExportacionEN> exportaciones =
              snapshot.data as List<ExportacionEN>;
          return ListView.builder(
            itemCount: exportaciones.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(exportaciones[index].producto),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        eliminarExportacion(exportaciones[index].id);

                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
