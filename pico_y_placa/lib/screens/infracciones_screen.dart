import 'package:flutter/material.dart';

class InfraccionesScreen extends StatefulWidget {
  const InfraccionesScreen({super.key});

  @override
  State<InfraccionesScreen> createState() => _InfraccionesScreenState();
}

class _InfraccionesScreenState extends State<InfraccionesScreen> {
  TextEditingController placaController = TextEditingController();
  String nroPlaca = "";
  String mostrarMensaje = "";
  Map <String, int> infracciones = {
    'abc123': 3,
    'bfc789': 10,
    'kkl890':1
  };

  void consultarInfracciones(){
    nroPlaca = placaController.text.toLowerCase();
    setState(() {
      if(infracciones.containsKey(nroPlaca)){
        mostrarMensaje = 'El número de infracciones de la placa $nroPlaca es de: ${infracciones[nroPlaca]}';
        infracciones[nroPlaca] = (infracciones[nroPlaca] ?? 0) + 1;
      }else{
        mostrarMensaje = 'La placa no tiene infracciones';
      }
    });
  }

  void agregarInfraccion(){
    if(!(infracciones.containsKey(nroPlaca))){
        infracciones[nroPlaca] = (infracciones[nroPlaca] ?? 0) + 1;
        mostrarMensaje = 'Se ha agregado una infraccion a la placa';
      }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Infracciones del vehículo', 
        style: TextStyle(color: Colors.white, fontSize: 35), ),
        backgroundColor: const Color.fromARGB(255, 255, 230, 0)
      ),
      body: Center(
        child: Container(
          width: 450,
          height: 450,
          color: Color.fromARGB(255, 255, 208, 78),
          child: Column(
            children: [
              TextField(
                controller: placaController,
                decoration: const InputDecoration(labelText: 'Número placa'),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: consultarInfracciones, child: const Text('Consultar infracciones de la placa')),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: agregarInfraccion, child: const Text('Agregar infracciones a la placa')),
                const SizedBox(height: 20),
                Text('INFRACCIONES: $mostrarMensaje')
            ]
            ),
        )
        ),
    );
  }
}