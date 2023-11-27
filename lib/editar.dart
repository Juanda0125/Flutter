


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Editar extends StatefulWidget {
  const Editar({Key? key, required Map<String, dynamic> proveedor}) : super(key: key);

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  List<dynamic> data = [];

  Future<void> editarRegistro(int ID, String nombre, String direccion, String telefono) async {
    final apiUrl = Uri.parse('https://api-k3nd.onrender.com/api/proveedor?ID=$ID');
    final response = await http.put(
      apiUrl,
      body: jsonEncode({
        'ID':ID,
        'nombre': nombre,
        'direccion': direccion,
        'telefono': telefono,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('Respuesta del servidor: ${response.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formProveedor = GlobalKey<FormState>();
    final ID = TextEditingController();
    final nombre = TextEditingController();
    final direccion = TextEditingController();
    final telefono = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar proveedores'),
        backgroundColor: const Color.fromARGB(255, 165, 0, 5),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formProveedor,
          child: Column(
            children: [
              TextFormField(
                controller: ID,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  label: Text('ID'),
                  icon: Icon(Icons.menu),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  label: Text('nombre'),
                  icon: Icon(Icons.person),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  label: Text('direccion'),
                  icon: Icon(Icons.gps_fixed),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  label: Text('telefono'),
                  icon: Icon(Icons.phone),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No puede estar vacío';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 60,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  if (!formProveedor.currentState!.validate()) {
                    print('No válido');
                    return;
                  } else {
                    editarRegistro(
                      int.parse(ID.text),
                      nombre.text,
                      direccion.text,
                      telefono.text,
                    );
                  }
                },
                child: const Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/proveedor.dart';


class Editar extends StatefulWidget {
  const Editar({Key? key, required Map<String, dynamic> proveedor}) : super(key: key);

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  List<dynamic> data = [];

  Future<void> editarRegistro(int id, String nombre, String direccion, String telefono) async {
    final apiUrl = Uri.parse('https://api-k3nd.onrender.com/api/proveedor/$id');
    final response = await http.put(
      apiUrl,
      body: jsonEncode({
        'nombre': nombre,
        'direccion': direccion,
        'telefono': telefono,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('Respuesta del servidor: ${response.statusCode}');
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formProveedor = GlobalKey<FormState>();
    final ID = TextEditingController();
    final nombre = TextEditingController();
    final direccion = TextEditingController();
    final telefono = TextEditingController();

    Editar(proveedor:{'ID':1, 'nombre':'aaa', 'direccion':'cfsa', 'telefono':'1242', });


    final Map<String, dynamic> proveedor = widget.proveedor;
    
    ID.text = proveedor['ID'].toString();
    nombre.text = proveedor['nombre'];
    direccion.text = proveedor['direccion'];
    telefono.text = proveedor['telefono'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar proveedores'),
        backgroundColor: const Color.fromARGB(255, 165, 0, 5),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formProveedor,
          child: Column(
            children: [
              TextFormField(
                controller: ID,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  label: Text('ID'),
                  icon: Icon(Icons.menu),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  label: Text('nombre'),
                  icon: Icon(Icons.person),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  label: Text('direccion'),
                  icon: Icon(Icons.gps_fixed),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  label: Text('telefono'),
                  icon: Icon(Icons.phone),
                  iconColor: Colors.red,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No puede estar vacío';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 60,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  if (!formProveedor.currentState!.validate()) {
                    print('No válido');
                    return;
                  } else {
                    editarRegistro(
                      int.parse(ID.text),
                      nombre.text,
                      direccion.text,
                      telefono.text,
                    );
                  }
                },
                child: const Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

*/

