
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ListarUsuarios extends StatefulWidget {
  const ListarUsuarios({super.key});

  @override
  State<ListarUsuarios> createState() => _ListarUsuariosState();
}

class _ListarUsuariosState extends State<ListarUsuarios> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar proveedores'),
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
                      return ListTile(
                        title: Text(filteredData[index]['nombre']),
                        subtitle: Text(filteredData[index]['direccion']),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

*/




import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:login/editar.dart';

class ListarUsuarios extends StatefulWidget {
  const ListarUsuarios({Key? key});

  @override
  State<ListarUsuarios> createState() => _ListarUsuariosState();
}

class _ListarUsuariosState extends State<ListarUsuarios> {
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

  void navigateToEditar(Map<String, dynamic> proveedor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Editar(proveedor: proveedor),
      ),
    ).then((value) {
      // Puedes realizar alguna acción después de editar el proveedor si lo deseas
      // Por ejemplo, puedes recargar la lista.
      getUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar proveedores'),
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
                      return ListTile(
                        title: Text(filteredData[index]['nombre']),
                        subtitle: Text(filteredData[index]['ID'].toString()),
                        onTap: () {
                          navigateToEditar(filteredData[index]);
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}


