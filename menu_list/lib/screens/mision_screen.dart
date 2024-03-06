import 'package:flutter/material.dart';

class MisionScreen extends StatefulWidget {
  const MisionScreen({super.key});

  @override
  State<MisionScreen> createState() => _MisionScreenState();
}

class _MisionScreenState extends State<MisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Misión', style: TextStyle(color: Colors.black, fontSize: 30),),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: const Text('Misión de la empresa', style: TextStyle(fontSize: 30, color: Colors.black, backgroundColor: Colors.tealAccent, ))
        ),
      ),
    );
  }
}