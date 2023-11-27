
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _ListarUsuariosState();
}

class _ListarUsuariosState extends State<Registrar> {
  List<dynamic> data=[];

Future<void> sendData(int? ID, String nombre, String direccion, String telefono) async{
  final apiUrl= Uri.parse('https://api-k3nd.onrender.com/api/proveedor');
  // ignore: unused_local_variable
  final response= await http.post(
    apiUrl,
    body: jsonEncode({
      'ID':ID,
      'nombre':nombre,
      'direccion':direccion,
      'telefono':telefono

    }),
    headers: {
      'Content-Type':'application/json',
    },
  );
}

 

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formProveedor= GlobalKey<FormState>();
    final ID= TextEditingController();
    final nombre= TextEditingController();
    final direccion= TextEditingController();
    final telefono= TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar proveedores'),
        backgroundColor: const Color.fromARGB(255,  165, 0, 5),

      ),
      body: SingleChildScrollView(
          child: Form(
        key: formProveedor,
        child: Column(children: [

        TextFormField(
          controller: ID,
          keyboardType: TextInputType.url,
          decoration: const InputDecoration(
            label:Text('ID'),
            icon: Icon(Icons.menu),
            iconColor: Colors.red,
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'No puede estar vacío';
            }
            return null;
          },
        ),
        const SizedBox(height: 20,),

         TextFormField(
          controller: nombre,
          keyboardType: TextInputType.url,
          decoration: const InputDecoration(
            label:Text('nombre'),
            icon: Icon(Icons.person),
            iconColor: Colors.red,
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'No puede estar vacío';
            }
            return null;
          },
        ),
          const SizedBox(height: 20,),
         TextFormField(
          controller: direccion,
          keyboardType: TextInputType.url,
          decoration: const InputDecoration(
            label:Text('direccion'),
            icon: Icon(Icons.gps_fixed),
            iconColor: Colors.red,
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'No puede estar vacío';
            }
            return null;
          },
        ),
        const SizedBox(height: 20,),

         TextFormField(
          controller: telefono,
          keyboardType: TextInputType.url,
          decoration: const InputDecoration(
            label:Text('telefono'),
            icon: Icon(Icons.phone),
            iconColor: Colors.red,
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'No puede estar vacío';
            }
            return null;
          },
        ),
        const SizedBox(height: 60,),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: 
                MaterialStateProperty.all(Colors.red)
          ),
          onPressed: (){    

            if(!formProveedor.currentState!.validate()){
              print('No valido');
              return;
            }
            else{
              sendData(int.parse(ID.text), nombre.text, direccion.text, telefono.text);
            }
          },
          child: const Text('Guardar'),
        )

      ],)
      )
      )
    );
  }
}