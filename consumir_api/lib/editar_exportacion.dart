// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:consumir_api/listar_exportaciones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarExportacion extends StatefulWidget {
  final Exportacion exportacion;
  const EditarExportacion({Key? key, required this.exportacion})
      : super(key: key);

  @override
  State<EditarExportacion> createState() => _EditarExportacionState();
}

class _EditarExportacionState extends State<EditarExportacion> {
  late TextEditingController productoController;
  late TextEditingController kilosController;
  late TextEditingController precioKilosController;
  late TextEditingController precioDolarController;

  @override
  void initState() {
    super.initState();
    productoController =
        TextEditingController(text: widget.exportacion.producto);
    kilosController =
        TextEditingController(text: widget.exportacion.kilos.toString());
    precioKilosController =
        TextEditingController(text: widget.exportacion.precio_kilo.toString());
    precioDolarController = TextEditingController(
        text: widget.exportacion.precio_dolar_actual.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Exportación'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: productoController,
              decoration: const InputDecoration(labelText: 'Producto'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: kilosController,
              decoration: const InputDecoration(labelText: 'Kilos'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: precioKilosController,
              decoration: const InputDecoration(labelText: 'Precio por kilo'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: precioDolarController,
              decoration: const InputDecoration(labelText: 'Precio en dólares'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Convertir los valores de texto a tipos numéricos
                int kilos = int.parse(kilosController.text);
                int precioKilos = int.parse(precioKilosController.text);
                double precioDolar = double.parse(precioDolarController.text);

                // Crear la instancia de Exportacion con los valores convertidos
                Exportacion exportacionActualizada = Exportacion( 
                  id_p: widget.exportacion.id_p,
                  producto: productoController.text,
                  kilos: kilos,
                  precio_kilo: precioKilos,
                  precio_dolar_actual: precioDolar,
                );
                await editarExportacion(exportacionActualizada);
                showDialog(
                  context: context, builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cambios guardados'),
                      content: const Text('Los cambios se guardaron con éxito.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Cierra el diálogo
                            Navigator.of(context)
                                .pop(); // Vuelve a la pantalla de listado
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editarExportacion(Exportacion exportacion) async {
    // URL de la API donde se encuentra el recurso a editar
    const String url = 'https://exportaciones-api.onrender.com/exportaciones';

    // Convierte los datos de la exportación a un formato que la API pueda entender (JSON)
    final Map<String, dynamic> datosActualizados = {
      // Aquí debes incluir los campos que deseas actualizar
      'id_p': exportacion.id_p,
      'producto': exportacion.producto,
      'kilos': exportacion.kilos,
      'precioKilos': exportacion.precio_kilo,
      'precioDolar': exportacion.precio_dolar_actual,
    };
    print('Datos actualizados:');
    print(datosActualizados);

    // Codificar los datos a JSON
    final String cuerpoJson = jsonEncode(datosActualizados);

    try {
      // Realiza la solicitud PUT al servidor
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json'
        }, // Establecer la cabecera para indicar que el cuerpo es JSON
        body: cuerpoJson, // Pasar el cuerpo codificado JSON
      );

      // Verifica si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        print('Exportación editada con éxito');
        setState(() {});
      } else {
        print('Error al editar exportación: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }
}
