import 'package:flutter/material.dart';
import 'package:pico_y_placa/screens/infracciones_screen.dart';
import 'package:pico_y_placa/screens/picoplaca_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas pico y placa e infracciones', 
        style: TextStyle(color: Colors.white, fontSize: 35), ),
        backgroundColor: const Color.fromARGB(255, 255, 230, 0)
      ),
      body: ListView(
        children: [
           ListTile(
            title: const Text('Pico y palca'),
            subtitle: const Text('Consulta tu día de pico y placa'),
            leading: const Icon(Icons.motorcycle_outlined, color: Color.fromARGB(255, 255, 230, 0), size: 60,),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black,),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const PicoPlacaScreen()
                );
                Navigator.push(context, route);
            },
          ),
           ListTile(
            title: const Text('Infracciones'),
            subtitle: const Text('Consulta las infracciones con las que cuenta tu vehículo'),
            leading: const Icon(Icons.dangerous_outlined, color: Colors.red, size: 60,),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const InfraccionesScreen()
                );
                Navigator.push(context, route);
            },
          ),

        ]
        ),
    );
  }
}