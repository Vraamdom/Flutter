import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

int contadorClick = 0;
//Tarea descontar clicks
class _ContadorScreenState extends State<ContadorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Contador Clicks: $contadorClick'),
      ),
      body: const Center(
          child: Text(
        'Numero de clicks',
        style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
          onPressed: () {
            contadorClick++;
            print(contadorClick);
            setState(() {}); //ACTUALIZAR EL SCREEN
          }
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
          onPressed: () {
            contadorClick--;
            print(contadorClick);
            setState(() {}); //ACTUALIZAR EL SCREEN
          }
          )
        ],
          ),
    );
  }
}