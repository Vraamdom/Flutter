import 'package:flutter/material.dart';

class AgregarVehiculoScreen extends StatefulWidget {
  const AgregarVehiculoScreen({super.key});

  @override
  State<AgregarVehiculoScreen> createState() => AgregarVehiculoScreenState();
}

class AgregarVehiculoScreenState extends State<AgregarVehiculoScreen> {

  void agregar(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar vehículo contratado', style: TextStyle(color: Colors.black, fontSize: 30),),
        backgroundColor: const Color.fromARGB(255, 46, 50, 247),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.car_crash_outlined, color:  Color.fromARGB(255, 0, 0, 0),),
                  hintText: "Tipo Vehículo",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Digitar Vehículo Contratado',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.username)
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline, color:  Color.fromARGB(255, 0, 0, 0),),
                  hintText: "Puestos",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Digitar Número de Puestos',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.password),
                  
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30,),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.money, color:  Color.fromARGB(255, 0, 0, 0),),
                  hintText: "Placa Vehículo",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Digitar Placa Vehículo',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: AutofillHints.password)
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                onPressed: agregar,
                 icon: const Icon(Icons.add), label: const Text('Agregar vehículo'), )
            ],
          ),
        ),
        ),
    );
  }
}