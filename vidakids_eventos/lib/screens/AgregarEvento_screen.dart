import 'package:vidakids_eventos/screens/ListarEventos_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  static String url =
      "https://eventosapiflutter.onrender.com/eventos"; //link de mi codigo consumible
  static postEvento(Map evento) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(evento),
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Falló la inserción contacta con el administrador del sistema");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class Evento extends StatefulWidget {
  const Evento({super.key});

  @override
  State<Evento> createState() => EventoState();
}

// ignore: non_constant_identifier_names
final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
TextEditingController nombreEvento = TextEditingController();
TextEditingController horaInicial = TextEditingController();
TextEditingController horaFinal = TextEditingController();
TextEditingController encargadoFundacion = TextEditingController();
TextEditingController encargadoEmpresa = TextEditingController();
TextEditingController telefonoEncargadoEmpresa = TextEditingController();
TextEditingController numeroParticipantes = TextEditingController();
TextEditingController estadoEvento = TextEditingController();
TextEditingController valorEvento = TextEditingController();

class EventoState extends State<Evento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un evento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese la cantidad de participantes del evento";
                      }
                      return null;
                    }
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: valorEvento,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Valor Evento",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Digitar el valor del evento',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: AutofillHints.name)),
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Porfavor ingrese la cantidad de participantes del evento";
                      }
                      return null;
                    }
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (_formLogin.currentState!.validate()) {
                      _formLogin.currentState!.save();
                      var evento = {
                      "nombre_evento": nombreEvento.text,
                      "hora_i": horaInicial.text,
                      "hora_f": horaFinal.text,
                      "encargado_f": encargadoFundacion.text,
                      "encargado_e": encargadoEmpresa.text,
                      "encargado_e_t": telefonoEncargadoEmpresa.text,
                      "nro_participantes": numeroParticipantes.text,
                      "estado": estadoEvento.text,
                      "valor": valorEvento.text,
                    };

                    print(evento);
                    Http.postEvento(evento).then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListarEventos(),
                        ),
                      );
                    });

                    final route = MaterialPageRoute(
                        builder: (context) => const ListarEventos());
                    Navigator.push(context, route);
                    }
                    
                  },
                  icon: const Icon(Icons.add_outlined),
                  label: const Text('Registrar Evento',
                      style: TextStyle(color: Colors.white)),
                )
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
