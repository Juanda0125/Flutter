import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Eliminar extends StatefulWidget {
  const Eliminar({Key? key});

  @override
  State<Eliminar> createState() => _EliminarState();
}

class _EliminarState extends State<Eliminar> {
  List<dynamic> data = [];
  List<dynamic> filteredData = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUsuarios();
  }

  Future<void> getUsuarios() async {
    final response = await http.get(Uri.parse('https://api-k3nd.onrender.com/api/proveedor'));

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);

      setState(() {
        data = decodedData['proveedores'] ?? [];
        filteredData = data; // Inicializa filteredData con todos los datos
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void filterData(String query) {
    setState(() {
      filteredData = data
          .where((element) =>
              element['nombre'].toLowerCase().contains(query.toLowerCase()) ||
              element['direccion'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> eliminarProveedor(int id) async {
    final apiUrl = Uri.parse('https://api-k3nd.onrender.com/api/proveedor?ID=$id');
    final response = await http.delete(apiUrl);

    if (response.statusCode == 200) {
      // Actualiza la lista después de eliminar el proveedor
      getUsuarios();
    } else {
      throw Exception('Failed to delete provider');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar proveedores'),
        backgroundColor: const Color.fromARGB(255, 165, 0, 5),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterData(value);
              },
              decoration: const InputDecoration(
                labelText: 'Buscar proveedores',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final proveedor = filteredData[index];
                      return ListTile(
                        title: Text(proveedor['nombre']),
                        subtitle: Text(proveedor['ID'].toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            eliminarProveedor(proveedor['ID']);

                            showDialog(context: context,  builder: (context){
                            return AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text('Eliminacion exitosa'),
                              actions: [
                                TextButton(onPressed: 
                                (){
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) =>  const Eliminar()));
                                }, child: const Text('Aceptar'))
                              ],
                            );
                            }
                            );
                          },
                        ),
                      );
                    },
                  ),
              ),
        ],
      ),
    );
  }
}
