import 'package:vidakids_eventos/screens/ListarParticipantes_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  static String url =
      "https://eventosapiflutter.onrender.com/participantes"; //link de mi codigo consumible
  static postParticipante(Map participante) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(participante),
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

class Participante extends StatefulWidget {
  const Participante({super.key});

  @override
  State<Participante> createState() => ParticipanteState();
}

// ignore: non_constant_identifier_names
final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
TextEditingController nombreParticipante = TextEditingController();
TextEditingController edadParticipante = TextEditingController();
TextEditingController generoParticipante = TextEditingController();
TextEditingController asistencia = TextEditingController();
TextEditingController placaVehiculoParticipante = TextEditingController();
TextEditingController documentoParticipante = TextEditingController();
TextEditingController tipoDocumento = TextEditingController();

class ParticipanteState extends State<Participante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un participante'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formLogin,
            child: Column(
              children: [
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formLogin.currentState!.validate()) {
                      _formLogin.currentState!.save();
                       var participante = {
                      "nombre_completo": nombreParticipante.text,
                      "edad": edadParticipante.text,
                      "genero_biologico": generoParticipante.text,
                      "tipo_documento": tipoDocumento.text,
                      "asistencia": asistencia.text,
                      "Placa_vehiculo_personal": placaVehiculoParticipante.text,
                      "nro_documento": documentoParticipante.text,
                    };

                    print(participante);
                    Http.postParticipante(participante).then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListarParticipantes(),
                        ),
                      );
                    });

                    final route = MaterialPageRoute(
                        builder: (context) => const ListarParticipantes());
                    Navigator.push(context, route);
                    }
                   
                  },
                  icon: const Icon(Icons.add_outlined),
                  label: const Text('Registrar Participante',
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
