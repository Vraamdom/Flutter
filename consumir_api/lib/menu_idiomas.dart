import 'package:flutter/material.dart';
import 'package:consumir_api/exportaciones.dart';
import 'package:consumir_api/exportaciones_EN.dart';

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
        title: const Text('Lenguage / Idioma', style: TextStyle(color: Colors.black, fontSize: 30),),
        backgroundColor: Colors.tealAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Español'),
            subtitle: const Text('Aplicación en español'),
            leading: const Icon(Icons.flag_outlined, color: Colors.tealAccent),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {//Abrir otra screen
              final route = MaterialPageRoute(
                builder: (context) => const Exportacion() );
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('English'),
            subtitle: const Text('Application in english'),
            leading: const Icon(Icons.flag_outlined, color: Colors.tealAccent),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {//Abrir otra screen
              final route = MaterialPageRoute(
                builder: (context) => const ExportacionEN() );
              Navigator.push(context, route);
            }
          ),
        ],
      ),
    );
  }
}