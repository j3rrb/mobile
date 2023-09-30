import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../models/usuario_model.dart';

class Usuarios extends StatefulWidget {
  @override
  State<Usuarios> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<Usuarios> {
  List<Usuario> _lista = [];
  final _random = Random();
  final String userImgUrl = "https://i.pravatar.cc/300?img=";
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController birthDateControl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Usuários"), actions: [
          IconButton(
              onPressed: () => {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: const Text('Adicionar usuário',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Nome'),
                                        controller: nameControl,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite um nome!';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Telefone'),
                                        controller: phoneControl,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite um telefone!';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'E-mail'),
                                        controller: emailControl,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite um e-mail!';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                        readOnly: true,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Data de nascimento'),
                                        controller: birthDateControl,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1899),
                                                  lastDate: DateTime(2030));
                                          if (pickedDate != null) {
                                            String dataFormatada =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(pickedDate);
                                            setState(() {
                                              birthDateControl.text =
                                                  dataFormatada;
                                            });
                                          }
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite uma data de nascimento!';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50), // NEW
                                ),
                                child: const Text('Criar'),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    int id = _random.nextInt(70);
                                    String url = "$userImgUrl$id";

                                    Usuario u = Usuario(
                                        nome: nameControl.text,
                                        urlFoto: url,
                                        dataNascimento: birthDateControl.text,
                                        telefone: phoneControl.text);

                                    setState(() {
                                      _lista.add(u);
                                    });

                                    nameControl.text = '';
                                    emailControl.text = '';
                                    birthDateControl.text = '';
                                    phoneControl.text = '';

                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            )
                          ],
                        );
                      },
                    )
                  },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
                semanticLabel: "Adicionar usuário",
              ))
        ]),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: ClipOval(
                      child: Image.network(_lista[index].urlFoto),
                    ),
                    title: Text(_lista[index].nome),
                    subtitle: Text(_lista[index].email));
              }),
        ));
  }
}
