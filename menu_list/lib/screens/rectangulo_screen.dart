import 'package:flutter/material.dart';

class RectanguloScreen extends StatefulWidget {
  const RectanguloScreen({super.key});

  @override
  State<RectanguloScreen> createState() => _RectanguloScreenState();
}

class _RectanguloScreenState extends State<RectanguloScreen> {
TextEditingController largoController = TextEditingController();
TextEditingController anchoController = TextEditingController();
String resultado = '';

void calcularArea(){
try{
 double largo = double.parse(largoController.text);
 double ancho = double.parse(anchoController.text);
 double area = largo * ancho;
 setState(() {
resultado = 'El area es: $area';
 });
 
}catch(e) {
  setState(() {
    resultado = 'No se puede calcular verifique';
  });
 
}
}

void calcularPerimetro(){
try{
 double largo = double.parse(largoController.text);
 double ancho = double.parse(anchoController.text);
 double perimetro = 2*largo + 2*ancho;
 setState(() {
resultado = 'El perimetro es: $perimetro';
 });
 
}catch(e) {
  setState(() {
    resultado = 'No se puede calcular verifique';
  });
 
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectangulo'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child:  Column(
            children: [
              TextField(
                controller: largoController,
                decoration: const InputDecoration(labelText: 'largo'),
                keyboardType: TextInputType.number,
                maxLength: 3,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: anchoController,
                decoration: const InputDecoration(labelText: 'ancho'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: calcularArea, child: Text('Calcular area')),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: calcularPerimetro, child: Text('perimetro area')),
              const SizedBox(height: 20),
              Text('Area $resultado')
            ],
          ),
        ),
      ),
    );
  }
}