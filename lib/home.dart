import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'layout/topbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TopBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black87,
              gradient: RadialGradient(
                  colors: [Colors.yellowAccent, Colors.yellow, Colors.red]),
            ),
            /* Se estiver executando na Web (Chrome) */
            //child: Image.asset("/images/computer.png")
            /* Se estiver executando no Emulador Android */
            /*child: Image.asset(
          "./assets/images/computer.png"
        )*/
            child: Lottie.asset("./assets/images/animacao.json")));
  }
}
