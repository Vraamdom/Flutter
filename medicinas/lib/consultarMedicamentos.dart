import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ConsultaMedicamientos extends StatefulWidget {
  const ConsultaMedicamientos({super.key});

  @override
  State<ConsultaMedicamientos> createState() => _ConsultaMedicamientosState();
}

class _ConsultaMedicamientosState extends State<ConsultaMedicamientos> {
String mensaje = '';
  TextEditingController _controller = TextEditingController();
  Future<void> buscarMedicamento(String nombreMedicamento) async {
    try {
      String nombreEnMayusculas = nombreMedicamento.toUpperCase();
      var url = Uri.parse('https://datos.gov.co/resource/sdmr-tfmf.json');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        bool encontrado = false;
        for (var medicamento in data) {
          if (medicamento['nombre_comercial_'] == nombreEnMayusculas) {
            setState(() {
              mensaje = 'El medicamento está disponible.';
            });
            encontrado = true;
            break;
          }
        }
        if (!encontrado) {
          setState(() {
            mensaje = 'El medicamento está escaso o no existe.';
          });
        }
      } else {
        setState(() {
          mensaje = 'Error al conectar con el servidor.';
        });
      }
    } catch (e) {
      setState(() {
        mensaje = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Medicamentos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              mensaje,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Campo de entrada para el nombre del medicamento
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Nombre del medicamento',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                buscarMedicamento(_controller.text); // Se pasa el texto del campo de entrada como parámetro
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}