import 'package:flutter/material.dart';

class PicoPlacaScreen extends StatefulWidget {
  const PicoPlacaScreen({super.key});

  @override
  State<PicoPlacaScreen> createState() => _PicoPlacaScreenState();
}



class _PicoPlacaScreenState extends State<PicoPlacaScreen> {
  TextEditingController placaController = TextEditingController();
  String dia = "";
 void diasPicoyplaca() {
    String numerosFinales = placaController.text;
    if (numerosFinales == '0' || numerosFinales == '1') {
      setState(() {
        dia = 'El día de pico y placa es el lunes';
      });
    } else if (numerosFinales == '2' || numerosFinales == '3') {
      setState(() {
        dia = 'El día de pico y placa es el martes';
      });
    } else if (numerosFinales == '4' || numerosFinales == '5') {
      setState(() {
        dia = 'El día de pico y placa es el miércoles';
      });
    } else if (numerosFinales == '6' || numerosFinales == '7') {
      setState(() {
        dia = 'El día de pico y placa es el jueves';
      });
    } else if (numerosFinales == '8' || numerosFinales == '9') {
      setState(() {
        dia = 'El día de pico y placa es el viernes';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Pico y placa', 
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
                maxLength: 1,
              ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: diasPicoyplaca, child: const Text('Consultar día de pico y placa')),
                const SizedBox(height: 20),
                Text('el vehículo tiene $dia')
            ]
            ),
        )
        ),
    );
  }
}