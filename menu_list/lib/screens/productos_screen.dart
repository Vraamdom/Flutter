import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos')
      ),
      body: const Column(
         children: [
          Row(
            children: [
            Icon(Icons.computer_outlined, size: 45, color: Colors.red,),
            Expanded(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Apple, Inc. es una empresa tecnológica multinacional estadounidense con sede en Cupertino, California. Apple es la empresa de tecnología más grande del mundo por ingresos, con US,3 mil millones de dólares en ingresos en 2022. En marzo de 2023, Apple es la empresa más grande del mundo por capitalización de mercado. En junio de 2022, Apple es el cuarto mayor proveedor de computadoras personales por ventas de unidades; la mayor empresa manufacturera por ingresos; y primer fabricante de teléfonos móviles del mundo en 20233​. Se considera una de las cinco grandes empresas estadounidenses de tecnología de la información, junto con Alphabet (empresa matriz de Google), Amazon, Meta Platforms (empresa matriz de Facebook) y Microsoft.'),))
          ]
          ),
          Row(
            children: [
            Icon(Icons.apple, size: 45, color: Colors.red,),
            Expanded(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('a empresa operaba, en mayo de 2014, más de 408 tiendas propias en nueve países,4​ miles de distribuidores (destacándose los distribuidores prémium o Apple Premium Resellers) y una tienda en línea (disponible en varios países) donde se venden sus productos y se presta asistencia técnica. De acuerdo con la revista Fortune, Apple fue la empresa más llamativa en el mundo entre 2008 y 2012.5​'),))
          ]
          )
         ],
       ),
    );
  }
}