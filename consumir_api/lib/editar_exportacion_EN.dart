import 'dart:convert';
import 'package:consumir_api/listar_exportaciones_EN.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class EditarExportacionEN extends StatefulWidget {
  final ExportacionEN exportacion;

  const EditarExportacionEN({required this.exportacion});

  @override
  _EditarExportacionStateEN createState() => _EditarExportacionStateEN();
}

class _EditarExportacionStateEN extends State<EditarExportacionEN> {
  late TextEditingController producto;
  late TextEditingController kilos;
  late TextEditingController precioKilos;
  late TextEditingController precioActualDolar;

  @override
  void initState() {
    super.initState();
    producto = TextEditingController(text: widget.exportacion.producto);
    kilos = TextEditingController(text: widget.exportacion.kilos.toString());
    precioKilos =
        TextEditingController(text: widget.exportacion.precio_kilo.toString());
    precioActualDolar = TextEditingController(
        text: widget.exportacion.precio_dolar_actual.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Exportación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: producto,
              decoration: const InputDecoration(
                hintText: 'Product',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Enter product name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: kilos,
              decoration: const InputDecoration(
                hintText: 'Kilograms',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Enter Kilograms',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: precioKilos,
              decoration: const InputDecoration(
                hintText: 'Price per kilo',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Enter price per kilo',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller: precioActualDolar,
              decoration: const InputDecoration(
                hintText: 'Dollar Price',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    // Obtener los nuevos valores introducidos por el usuario
    String nuevoProducto = producto.text;
    int nuevosKilos = int.parse(kilos.text);
    int nuevoPrecioKilos = int.parse(precioKilos.text);
    double nuevoPrecioActualDolar = double.parse(precioActualDolar.text);

    // Crear el cuerpo de la solicitud con los nuevos valores y el ID original
    Map<String, dynamic> cuerpoSolicitud = {
      "_id": widget.exportacion.id, // Incluye el ID original en el cuerpo de la solicitud
      "producto": nuevoProducto,
      "kilos": nuevosKilos,
      "precio_kilo": nuevoPrecioKilos,
      "precio_dolar_actual": nuevoPrecioActualDolar,
    };

    // Realizar la solicitud HTTP para actualizar la exportación
    http.put(
      Uri.parse(
          "https://exportaciones-ivyq.onrender.com/exportaciones/${widget.exportacion.id}"),
      body: jsonEncode(cuerpoSolicitud), // Codifica el cuerpo de la solicitud como JSON
      headers: {"Content-Type": "application/json"}, // Establece el tipo de contenido como JSON
    ).then((response) {
      // Verificar si la solicitud fue exitosa
      if (response.statusCode == 200) {
        // La exportación fue actualizada con éxito
        print("The export was updated successfully");
        Navigator.pop(context, true);
      } else {
        // Hubo un error al actualizar la exportación
        print(
            "There was an error updating the export: ${response.statusCode}");
      }
    }).catchError((error) {
      // Manejar cualquier error de solicitud
      print("Error making HTTP request: $error");
    });
  },
  child: const Text('Save'),
),
          ],
        ),
      ),
    );
  }
}
