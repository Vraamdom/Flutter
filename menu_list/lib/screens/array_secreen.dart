import 'package:flutter/material.dart';

class ScreenArray extends StatefulWidget{
  const ScreenArray({super.key});

  @override
  State<ScreenArray>createState()=>_ScreenArrayState();
}
final List<String>aprendices=["andres","feli","luz","sebas"];
int numeroAprendices=0;

class _ScreenArrayState extends State<ScreenArray>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text("recorrido el array"),
      ),
      body:ListView.builder(itemCount: aprendices.length, itemBuilder:(BuildContext context,index){
        numeroAprendices++;
        return ListTile(
          leading: const Icon(Icons.person_2_outlined,color: Colors.blue,),
          title: Text(aprendices[index]),
          subtitle: Text("Aprendicez: $numeroAprendices"),
        );


      }),
    );
  }
}