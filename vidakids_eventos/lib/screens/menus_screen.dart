import 'package:flutter/material.dart';
import 'package:vidakids_eventos/screens/agregarVehiculo_screen.dart';

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
        title: const Text('Mi app', style: TextStyle(color: Colors.white, fontSize: 30),),
        backgroundColor: const Color.fromARGB(255, 46, 50, 247),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Home'),
            subtitle: Text('Inicio de la aplicación'),
            leading: Icon(Icons.home, color: Color.fromARGB(255, 46, 50, 247)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
           ListTile(
            title: const Text('Agregar vehículo'),
            subtitle: const Text('Formulario para agregar vehículo contratado'),
            leading: const Icon(Icons.add_outlined, color: Color.fromARGB(255, 46, 50, 247)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {//Abrir otra screen
              final route = MaterialPageRoute(
                builder: (context) => const AgregarVehiculoScreen() );
              Navigator.push(context, route);
            }
          ),
          const ListTile(
            title: Text('Agregar Participante'),
            subtitle: Text('Formulario para agregar participantes al evento'),
            leading: Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 46, 50, 247)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
          const ListTile(
            title: Text('Agregar Evento'),
            subtitle: Text('Formulario para agregar evento'),
            leading: Icon(Icons.calendar_month_outlined, color: Color.fromARGB(255, 46, 50, 247)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
           
        ],
      ),
    );
  }
}