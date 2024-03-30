// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:vidakids_eventos/screens/EditarEvento_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Evento {
  final String id;
  final String nombre_evento;
  final String hora_i;
  final String hora_f;
  final String encargado_f;
  final String encargado_e;
  final String encargado_e_t;
  final int nro_participantes;
  final String estado;

  Evento({
    required this.id,
    required this.nombre_evento,
    required this.hora_i,
    required this.hora_f,
    required this.encargado_f,
    required this.encargado_e,
    required this.encargado_e_t,
    required this.nro_participantes,
    required this.estado,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['_id'],
      nombre_evento: json['nombre_evento'],
      hora_i: json['hora_i'],
      hora_f: json['hora_f'],
      encargado_f: json['encargado_f'],
      encargado_e: json['encargado_e'],
      encargado_e_t: json['encargado_e_t'],
      nro_participantes: json['nro_participantes'],
      estado: json['estado'],
    );
  }
}

Future<List<Evento>> fetchPost() async {
  final response = await http.get(
      Uri.parse("https://eventosapiflutter.onrender.com/eventos"));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> eventosJson = jsonData['msg'];
    return eventosJson.map((json) => Evento.fromJson(json)).toList();
  } else {
    throw Exception('Fallo la carga de los eventos');
  }
}

class ListarEventos extends StatefulWidget {
  const ListarEventos({Key? key}) : super(key: key);

  @override
  State<ListarEventos> createState() => _ListarEventosState();
}

class _ListarEventosState extends State<ListarEventos> {
  late List<Evento> eventos;

  @override
  void initState() {
    super.initState();
    eventos = [];
  }

 void editarEvento(BuildContext context, Evento evento) async {
  // Navegar a la pantalla de edición y esperar el resultado
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditarEvento(evento: evento),
    ),
  );

  // Verificar si se realizó la edición
  if (result != null && result is bool && result) {
    // Actualizar la lista de exportaciones
    setState(() {
      // Encuentra y reemplaza la exportación editada en la lista de exportaciones
      int index = eventos.indexWhere((e) => e.id == evento.id);
      if (index != -1) {
        eventos[index] = evento;
      }
    });
  }
}


  Future<void> eliminarEvento(String id) async {
    final response = await http.delete(
      Uri.parse("https://eventosapiflutter.onrender.com/eventos/$id"),
    );
    if (response.statusCode == 200) {
      print('Registro eliminado exitosamente');
      setState(() {
      eventos.removeWhere((e) => e.id == id);
      });
    } else {
      print('Error al eliminar el registro: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Eventos"),
      ),
      body: FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          List<Evento> eventos =
              snapshot.data as List<Evento>;
          return ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(eventos[index].nombre_evento),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventos[index].hora_i.toString()),
                    Text(eventos[index].hora_f.toString()),
                    Text(eventos[index].encargado_f.toString()),
                    Text(eventos[index].encargado_e.toString()),
                    Text(eventos[index].encargado_e_t.toString()),
                    Text(eventos[index].nro_participantes.toString()),
                    Text(eventos[index].estado.toString()),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        editarEvento(context, eventos[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        eliminarEvento(eventos[index].id);

                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Center(
              child: Text(
                '© Derechos de autor Brandon Mejía Betancur 2024',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
    );
  }
}
