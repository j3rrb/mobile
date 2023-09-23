import 'package:flutter/material.dart';
import 'dart:math';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => CalcState();
}

class CalcState extends State<Calc> {

  num myVar = 0;
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 30.0
          ),
          child: TextField(
            controller: control1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Primeiro valor"
            )
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 30.0
          ),
          child: TextField(
            controller: control2,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Segundo valor"
            )
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                ElevatedButton(
                    child: const Text("Somar"),
                    onPressed: () {
                      num n1 = num.parse(control1.text);
                      num n2 = num.parse(control2.text);
                      setState(() {
                        myVar = n1 + n2;
                      });
                    }
                ),
                ElevatedButton(
                    child: const Text("Subtrair"),
                    onPressed: () {
                      num n1 = num.parse(control1.text);
                      num n2 = num.parse(control2.text);
                      setState(() {
                        myVar = n1 - n2;
                      });
                    }
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    child: const Text("Multiplicar"),
                    onPressed: () {
                      num n1 = num.parse(control1.text);
                      num n2 = num.parse(control2.text);
                      setState(() {
                        myVar = n1 * n2;
                      });
                    }
                ),
                ElevatedButton(
                    child: const Text("Dividir"),
                    onPressed: () {
                      num n1 = num.parse(control1.text);
                      num n2 = num.parse(control2.text);
                      setState(() {
                        myVar = n1 / n2;
                      });
                    }
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    child: const Text("Exponenciar"),
                    onPressed: () {
                      num n1 = num.parse(control1.text);
                      num n2 = num.parse(control2.text);
                      setState(() {
                        myVar = pow(n1, n2).toDouble();
                      });
                    }
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "$myVar",
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 45.0,
              fontWeight: FontWeight.bold
            )
          )
        )
        
      ]
    ));
  }

}