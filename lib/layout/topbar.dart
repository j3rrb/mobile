import 'package:flutter/material.dart';

import '../pages/calc.dart';
import '../pages/second.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Top Navigation"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.photo_album))
            ]
          )
        ),
        body: const TabBarView(
          children: [
            Second(),
            Calc(),
            Text("Em Construção")
          ],
        )
      )
    );
  }

  
}