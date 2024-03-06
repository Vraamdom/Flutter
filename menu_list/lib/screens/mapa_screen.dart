import 'package:flutter/material.dart';


class Mywidget extends StatefulWidget{
  const Mywidget ({super.key});

  @override
  State<Mywidget>createState()=>MywidgetState();
  
  MywidgetState() {}
}
class Producto {
String nombre;
double precio;
String referencia;

Producto(this.nombre, this.precio, this.referencia);
}

void main() {
Map<int, Producto> productos = {
1: Producto('Producto 1', 10.99, 'REF001'),
2: Producto('Producto 2', 20.49, 'REF002'),
3: Producto('Producto 3', 15.79, 'REF003'),
4: Producto('Producto 4', 5.99, 'REF004'),
5: Producto('Producto 5', 8.49, 'REF005'),
6: Producto('Producto 6', 12.99, 'REF006'),
7: Producto('Producto 7', 9.99, 'REF007'),
8: Producto('Producto 8', 18.49, 'REF008'),
9: Producto('Producto 9', 6.79, 'REF009'),
10: Producto('Producto 10', 14.99, 'REF010'),
};

productos.forEach((key, value) {
print('ID: $key - Nombre: ${value.nombre} - Precio: ${value.precio} - Referencia: ${value.referencia}');
});
}

