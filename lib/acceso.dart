import 'package:flutter/material.dart';
import 'package:login/Inicio.dart';
class Usuario {
  final String nombre;
  final String contrasena;

  Usuario(this.nombre, this.contrasena);
}

// ignore: must_be_immutable
class Acceso extends StatelessWidget {
  Acceso({super.key});

  List<Usuario> login1 = [Usuario('juan', 'juan123')];

  final GlobalKey<FormState> formUsuario = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final contra = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Donde Lucho'),
          backgroundColor: const Color.fromARGB(255, 199, 0, 0),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Form(
              key: formUsuario,
              child: Column(
                children: [
                  TextFormField(
                    controller: usuario,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Usuario',
                        hintText: 'Usuario'),
                        validator: (value) {
                          if (value!.isEmpty)return 'Este campo es requerido';  
                          return null;
                        },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: contra,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Contraseña',
                        hintText: 'Contraseña'),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo es requerido';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 165, 0, 5)),
                      ),
                      onPressed: () {
                        bool validar(String usuario, String contra) {
                          Usuario encontrado =
                              login1.firstWhere((u) => u.nombre == usuario);
                          // ignore: unnecessary_null_comparison
                          return encontrado != null &&
                              encontrado.contrasena == contra;
                        }

                        if (validar(usuario.text, contra.text)) {


                          showDialog(context: context,  builder: (context){
                          return AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text('Registro exitoso'),
                              actions: [
                                TextButton(onPressed: 
                                (){
                                  Navigator.pop(context);
                                 
                                }, child: const Text('Aceptar'))
                              ],
                          );
                          }
                          );

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) =>  Inicio()));
                        } else {                         

                          showDialog(context: context,  builder: (context){
                          return AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text('Usuario y/o constraseña incorrecta'),
                              actions: [
                                TextButton(onPressed: 
                                (){
                                  Navigator.pop(context);
                                 
                                }, child: const Text('Aceptar'))
                              ],
                          );
                          }
                          );
                        }
                      },
                      child: const Text('Ingresar'))
                ],
              ),
            ),
          ),
        ));
  }
}