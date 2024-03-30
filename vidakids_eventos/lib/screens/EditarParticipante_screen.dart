import 'dart:convert';
import 'package:vidakids_eventos/screens/ListarParticipantes_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarParticipante extends StatefulWidget {
  final Participante participante;

  const EditarParticipante({required this.participante});

  @override
  _EditarParticipanteState createState() => _EditarParticipanteState();
}

class _EditarParticipanteState extends State<EditarParticipante> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  late TextEditingController nombreParticipante;
  late TextEditingController edadParticipante;
  late TextEditingController generoParticipante;
  late TextEditingController asistencia;
  late TextEditingController placaVehiculoParticipante;
  late TextEditingController documentoParticipante;
  late TextEditingController tipoDocumento;

  @override
  void initState() {
    super.initState();
    nombreParticipante =
        TextEditingController(text: widget.participante.nombre_completo);
    edadParticipante = TextEditingController(text: widget.participante.edad);
    generoParticipante =
        TextEditingController(text: widget.participante.genero_biologico);
    asistencia =
        TextEditingController(text: widget.participante.asistencia.toString());
    placaVehiculoParticipante = TextEditingController(
        text: widget.participante.Placa_vehiculo_personal);
    documentoParticipante = TextEditingController(
        text: widget.participante.nro_documento.toString());
    tipoDocumento =
        TextEditingController(text: widget.participante.tipo_documento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Participante'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formLogin,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: nombreParticipante,
                    decoration: const InputDecoration(
                      hintText: "Nombre Participante",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Digitar nombre completo del participante',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el nombre del participante";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: edadParticipante,
                    decoration: const InputDecoration(
                      hintText: "Edad Participante",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Digitar la edad del participante',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese la edad del participante";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    controller: generoParticipante,
                    decoration: const InputDecoration(
                      hintText: "Genero Biologico",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText:
                          'Digitar el genero biologico del participante.',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el genero del participante";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    controller: asistencia,
                    decoration: const InputDecoration(
                      hintText: "Asistencia Participante",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Digitar la asistencia del participante.',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return "Porfavor ingrese la asistencia del participante";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    controller: tipoDocumento,
                    decoration: const InputDecoration(
                      hintText: "Tipo Documento",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText:
                          'Digitar el tipo de documento del participante.',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el tipo de documento del participante";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                  controller: placaVehiculoParticipante,
                  decoration: const InputDecoration(
                    hintText: "Placa Vehículo Personal",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText:
                        'Digitar la palca del vehículo del participante.',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: AutofillHints.name),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: documentoParticipante,
                    decoration: const InputDecoration(
                      hintText: "Número Documento",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText:
                          'Digitar el número del documento de identidad.',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el documento del participante";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formLogin.currentState!.validate()) {
                      _formLogin.currentState!.save();
                      // Obtener los nuevos valores introducidos por el usuario
                    String nuevoNombre = nombreParticipante.text;
                    String nuevoEdad = edadParticipante.text;
                    String nuevoGenero = generoParticipante.text;
                    String nuevoAsistencia = asistencia.text;
                    String nuevoTipoDocumento = tipoDocumento.text;
                    String nuevoPlacaVehiculoPersonal =
                        placaVehiculoParticipante.text;
                    int nuevoNumeroDocumento =
                        int.parse(documentoParticipante.text);

                    // Crear el cuerpo de la solicitud con los nuevos valores y el ID original
                    Map<String, dynamic> cuerpoSolicitud = {
                      "_id": widget.participante
                          .id, // Incluye el ID original en el cuerpo de la solicitud
                      "nombre_completo": nuevoNombre,
                      "edad": nuevoEdad,
                      "genero_biologico": nuevoGenero,
                      "tipo_documento": nuevoTipoDocumento,
                      "asistencia": nuevoAsistencia,
                      "Placa_vehiculo_personal": nuevoPlacaVehiculoPersonal,
                      "nro_documento": nuevoNumeroDocumento,
                    };

                    // Realizar la solicitud HTTP para actualizar la exportación
                    http.put(
                      Uri.parse(
                          "https://eventosapiflutter.onrender.com/participantes/${widget.participante.id}"),
                      body: jsonEncode(cuerpoSolicitud),
                      headers: {
                        "Content-Type": "application/json"
                      }, // Establece el tipo de contenido como JSON
                    ).then((response) {
                      if (response.statusCode == 200) {
                        print("El participante fue actualizado con éxito");
                        Navigator.pop(context, true);
                      } else {
                        print(
                            "Hubo un error al actualizar el participante: ${response.statusCode}");
                      }
                    }).catchError((error) {
                      print("Error al realizar la solicitud HTTP: $error");
                    });
                    }
                    
                  },
                  child: const Text('Actualizar Participante'),
                ),
              ],
            ),
          ),
        ),
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
