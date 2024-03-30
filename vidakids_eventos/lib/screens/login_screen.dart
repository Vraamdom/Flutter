import 'package:flutter/material.dart';
import 'package:vidakids_eventos/screens/menus_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  String nombreUsuario = '';
  String password = '';
  String mostrarMensaje = '';
  void acceder(String nombreUsuario, String password){
    
    print(nombreUsuario);
    print(password);

    if(nombreUsuario == "Brandon" && password == "boberto33"){
      final route = MaterialPageRoute(
      builder: (context) => const MenuScreen() );
      Navigator.push(context, route);
      
    }else{
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  child: Stack(
    children: [
      // Formulario
      Form(
        key: _formLogin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Iniciar Sesión',
            style: TextStyle(
              fontSize: 35.0
            )),
            TextFormField(
              enableInteractiveSelection: false,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Nombre Usuario",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar nombre del usuario',
                suffixIcon: Icon(Icons.verified_user),
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontFamily: AutofillHints.name)),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Porfavor ingrese su usuario";
                }
                return null;
              },
              onSaved: (value){
                nombreUsuario = value!;
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Digitar Contraseña',
                suffixIcon: Icon(Icons.lock_person_outlined),
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontFamily: AutofillHints.name)),
              validator: (value){
                if(value == null || value.length < 8){
                  return "Porfavor ingrese una contraseña de al menos 8 dígitos";
                }
                return null;
              },
              onSaved: (value){
                password = value!;
              },
            ),
            const SizedBox(height: 30,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
              onPressed: (){
                if(_formLogin.currentState!.validate()){
                  _formLogin.currentState!.save();
                  acceder(nombreUsuario, password);
                }
              },
              label: const Text('Acceder', style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.login_rounded, color: Colors.white), 
            )
          ],
        ),
      ),
    ],
  ),
),

      );

  }
}
