import 'package:flutter/material.dart';
import 'package:login/acceso.dart';
import 'package:login/eliminar.dart';
import 'package:login/listarUsuarios.dart';
import 'package:login/registrar.dart';

void main() {
  runApp(Inicio());
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menu1(),
    );
  }
}

class Menu1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apis'),
        backgroundColor: const Color.fromARGB(255, 165, 0, 5),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 165, 0, 5),
                ),
                child: Row(
                  children: [
                    
                    SizedBox(width: 10), 
                    Text(''),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.menu, color: Color.fromARGB(255, 165, 0, 5)),
              title: const Text('Listar proveedores'),
              trailing: const Icon(Icons.arrow_circle_right, color: Color.fromARGB(255, 165, 0, 5)),
              onTap: () {
                final route = MaterialPageRoute(builder: (context) => const ListarUsuarios());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.plus_one, color: Color.fromARGB(255, 165, 0, 5)),
              title: const Text('Registrar proveedores'),
              trailing: const Icon(Icons.arrow_circle_right, color: Color.fromARGB(255, 165, 0, 5)),
              onTap: () {
                final route = MaterialPageRoute(builder: (context) => const Registrar());
                Navigator.push(context, route);
              },
            ),           
            ListTile(
              leading: const Icon(Icons.delete, color: Color.fromARGB(255, 165, 0, 5)),
              title: const Text('Eliminar proveedores'),
              trailing: const Icon(Icons.arrow_circle_right, color: Color.fromARGB(255, 165, 0, 5)),
              onTap: () {
                final route = MaterialPageRoute(builder: (context) => const Eliminar());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromARGB(255, 165, 0, 5)),
              title: const Text('Salir'),
              onTap: () {
                final route = MaterialPageRoute(builder: (context) => Acceso());
                Navigator.pushReplacement(context, route);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Hola', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
