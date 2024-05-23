import 'dart:async';

import 'package:api_tester/screens/main_home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 400, seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainHome(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           colors: [Colors.black87, Colors.deepOrangeAccent],
         ),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           const Center(child: Icon(Icons.api, size: 100, color: Colors.white)),
            const SizedBox(height: 20),
           Text('API PULSE', style: Theme.of(context).textTheme.bodyMedium),
         ],
       ),
     ),
      );
  }
}
