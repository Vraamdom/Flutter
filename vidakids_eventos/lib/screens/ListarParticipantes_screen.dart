// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:vidakids_eventos/screens/EditarParticipante_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Participante {
  final String id;
  final String nombre_completo;
  final String edad;
  final String genero_biologico;
  final String tipo_documento;
  final bool asistencia;
  final String Placa_vehiculo_personal;
  final int nro_documento;

  Participante({
    required this.id,
    required this.nombre_completo,
    required this.edad,
    required this.genero_biologico,
    required this.tipo_documento,
    required this.asistencia,
    required this.Placa_vehiculo_personal,
    required this.nro_documento,
  });

  factory Participante.fromJson(Map<String, dynamic> json) {
    return Participante(
        id: json['_id'],
        nombre_completo: json['nombre_completo'],
        edad: json['edad'],
        genero_biologico: json['genero_biologico'],
        tipo_documento: json['tipo_documento'],
        asistencia: json['asistencia'],
        Placa_vehiculo_personal: json['Placa_vehiculo_personal'],
        nro_documento: json['nro_documento']);
  }
}

Future<List<Participante>> fetchPost() async {
  final response = await http
      .get(Uri.parse("https://eventosapiflutter.onrender.com/participantes"));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> participantesJson = jsonData['msg'];
    return participantesJson
        .map((json) => Participante.fromJson(json))
        .toList();
  } else {
    throw Exception('Fallo la carga de los participantes');
  }
}

class ListarParticipantes extends StatefulWidget {
  const ListarParticipantes({Key? key}) : super(key: key);

  @override
  State<ListarParticipantes> createState() => _ListarParticipantesState();
}

class _ListarParticipantesState extends State<ListarParticipantes> {
  late List<Participante> participantes;

  @override
  void initState() {
    super.initState();
    participantes = [];
  }

  void editarParticipante(
      BuildContext context, Participante participante) async {
    // Navegar a la pantalla de edición y esperar el resultado
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarParticipante(participante: participante),
      ),
    );

    // Verificar si se realizó la edición
    if (result != null && result is bool && result) {
      // Actualizar la lista de exportaciones
      setState(() {
        // Encuentra y reemplaza la exportación editada en la lista de exportaciones
        int index = participantes.indexWhere((e) => e.id == participante.id);
        if (index != -1) {
          participantes[index] = participante;
        }
      });
    }
  }

  Future<void> eliminarParticipante(String id) async {
    final response = await http.delete(
      Uri.parse("https://eventosapiflutter.onrender.com/participantes/$id"),
    );
    if (response.statusCode == 200) {
      print('Registro eliminado exitosamente');
      setState(() {
      participantes.removeWhere((e) => e.id == id);
      });
    } else {
      print('Error al eliminar el registro: ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Participantes"),
      ),
      body: FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          List<Participante> participantes =
              snapshot.data as List<Participante>;
          return ListView.builder(
            itemCount: participantes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(participantes[index].nombre_completo),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(participantes[index].edad.toString()),
                    Text(participantes[index].genero_biologico.toString()),
                    Text(participantes[index].asistencia.toString()),
                    Text(participantes[index]
                        .Placa_vehiculo_personal
                        .toString()),
                    Text(participantes[index].tipo_documento.toString()),
                    Text(participantes[index].nro_documento.toString()),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        editarParticipante(context, participantes[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        // Mostrar un diálogo de confirmación
                        bool confirmacion = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirmar eliminación'),
                              content: const Text(
                                  '¿Estás seguro de que deseas eliminar este registro?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(false); // No elimina el registro
                                  },
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(true); // Confirma la eliminación
                                  },
                                  child: const Text('Eliminar'),
                                ),
                              ],
                            );
                          },
                        );

                        // Si el usuario confirma la eliminación, proceder a eliminar el registro
                        if (confirmacion == true) {
                          eliminarParticipante(participantes[index].id);
                        }
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
          child: const Center(
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
