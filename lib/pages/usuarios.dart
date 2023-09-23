import 'package:flutter/material.dart';

import '../models/usuario_model.dart';

class Usuarios extends StatefulWidget {
  @override
  State<Usuarios> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<Usuarios> {
  /// Lista de objetos da classe Usuario
  List<Usuario> _lista = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Usuários"), actions: [
          IconButton(
              onPressed: () => {print("Adicionar usuário")},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
                semanticLabel: "Adicionar usuário",
              ))
        ]),
        body: ListView.builder(
            itemCount: _lista.length,
            // Tamanho da lista
            // context: contexto da aplicação (tela atual)
            // index: índice de cada item, iterado de 0 até n-1 (n = tamanho da lista)
            itemBuilder: (context, index) {
              return ListTile(
                  leading: ClipOval(
                    child: Image.network(_lista[index].urlFoto),
                  ),
                  title: Text(_lista[index].nome),
                  subtitle: Text(_lista[index].email));
            }));
  }
}
