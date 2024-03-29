import 'dart:convert';
import 'package:vidakids_eventos/screens/ListarEventos_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarEvento extends StatefulWidget {
  final Evento evento;

  const EditarEvento({required this.evento});

  @override
  _EditarEventoState createState() => _EditarEventoState();
}

class _EditarEventoState extends State<EditarEvento> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  late TextEditingController nombreEvento;
  late TextEditingController horaInicial;
  late TextEditingController horaFinal;
  late TextEditingController encargadoFundacion;
  late TextEditingController encargadoEmpresa;
  late TextEditingController telefonoEncargadoEmpresa;
  late TextEditingController numeroParticipantes;
  late TextEditingController estadoEvento;

  @override
  void initState() {
    super.initState();
    nombreEvento = TextEditingController(text: widget.evento.nombre_evento);
    horaInicial = TextEditingController(text: widget.evento.hora_i);
    horaFinal = TextEditingController(text: widget.evento.hora_f);
    encargadoFundacion = TextEditingController(text: widget.evento.encargado_f);
    encargadoEmpresa = TextEditingController(text: widget.evento.encargado_e);
    telefonoEncargadoEmpresa =
        TextEditingController(text: widget.evento.encargado_e_t);
    numeroParticipantes =
        TextEditingController(text: widget.evento.nro_participantes.toString());
    estadoEvento = TextEditingController(text: widget.evento.estado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Evento'),
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
                TextFormField(
                    controller: nombreEvento,
                    decoration: const InputDecoration(
                        hintText: "Nombre Evento",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Digitar nombre del evento',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el nombre del evento";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: horaInicial,
                    decoration: const InputDecoration(
                        hintText: "Hora inicial",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Digitar la hora a la que inicia el evento',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese la hora inicial del evento";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: horaFinal,
                    decoration: const InputDecoration(
                        hintText: "Hora Final",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText:
                            'Digitar la hora a la que finaliza el evento',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese la hora final del evento";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: encargadoFundacion,
                    decoration: const InputDecoration(
                        hintText: "Encargado Fundacion",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText:
                            'Digitar el encagardo del evento de la fundación',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el encargado de la fundación";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: encargadoEmpresa,
                    decoration: const InputDecoration(
                        hintText: "Encargado Empresa",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Digitar el encagardo de la empresa',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese su el encargado de la empresa";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: telefonoEncargadoEmpresa,
                    decoration: const InputDecoration(
                        hintText: "Telefono Encargado Empresa",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText:
                            'Digitar el telefono del encagardo de la empresa',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese el telefono del encargado de la empresa";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: numeroParticipantes,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Cantidad Participantes",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText:
                            'Digitar el número de participantes para el evento',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AutofillHints.name)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese la cantidad de participantes del evento";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: estadoEvento,
                  decoration: const InputDecoration(
                      hintText: "Estado Evento",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Digitar el estado del evento',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formLogin.currentState!.validate()) {
                      _formLogin.currentState!.save();
                      // Obtener los nuevos valores introducidos por el usuario
                    String nuevoNombreEvento = nombreEvento.text;
                    String nuevoHoraInicial = horaInicial.text;
                    String nuevoHoraFinal = horaFinal.text;
                    String nuevoEncargadoFundacion = encargadoFundacion.text;
                    String nuevoEncargadoEmpresa = encargadoEmpresa.text;
                    String nuevoTelefonoEncargadoEmpresa =
                        telefonoEncargadoEmpresa.text;
                    int nuevoNumeroParticipantes =
                        int.parse(numeroParticipantes.text);
                    String nuevoEstadoEvento = estadoEvento.text;

                    // Crear el cuerpo de la solicitud con los nuevos valores y el ID original
                    Map<String, dynamic> cuerpoSolicitud = {
                      "_id": widget.evento
                          .id, // Incluye el ID original en el cuerpo de la solicitud
                      "nombre_evento": nuevoNombreEvento,
                      "hora_i": nuevoHoraInicial,
                      "hora_f": nuevoHoraFinal,
                      "encargado_f": nuevoEncargadoFundacion,
                      "encargado_e": nuevoEncargadoEmpresa,
                      "encargado_e_t": nuevoTelefonoEncargadoEmpresa,
                      "nro_participantes": nuevoNumeroParticipantes,
                      "estado": nuevoEstadoEvento
                    };

                    // Realizar la solicitud HTTP para actualizar la exportación
                    http.put(
                      Uri.parse(
                          "https://eventosapiflutter.onrender.com/eventos/${widget.evento.id}"),
                      body: jsonEncode(cuerpoSolicitud),
                      headers: {
                        "Content-Type": "application/json"
                      }, // Establece el tipo de contenido como JSON
                    ).then((response) {
                      if (response.statusCode == 200) {
                        print("El evento fue actualizada con éxito");
                        Navigator.pop(context, true);
                      } else {
                        print(
                            "Hubo un error al actualizar el evento: ${response.statusCode}");
                      }
                    }).catchError((error) {
                      print("Error al realizar la solicitud HTTP: $error");
                    });
                    }
                    
                  },
                  child: const Text('Actualizar Evento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
