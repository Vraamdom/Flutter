import 'package:flutter/material.dart';
import 'package:vidakids_eventos/screens/AgregarEvento_screen.dart';
import 'package:vidakids_eventos/screens/AgregarParticipante_.dart';
import 'package:vidakids_eventos/screens/login_screen.dart';


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
        title: const Text(
          'Eventos VidaKids',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 46, 50, 247),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (context) => const Login() );
              Navigator.push(context, route);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
           ListTile(
            title: const Text('Agregar Evento'),
            subtitle: const Text('Formulario para agregar un evento.'),
            leading: const Icon(Icons.add_outlined, color: Color.fromARGB(255, 46, 50, 247)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const Evento() );
              Navigator.push(context, route);
            }
          ),
          ListTile(
            title: const Text('Agregar Participante'),
            subtitle: const Text('Formulario para agregar participantes al evento'),
            leading: const Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 46, 50, 247)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context) => const Participante());
              Navigator.push(context, route);
            },
          ),
           
        ],
      ),
    );
  }
}
