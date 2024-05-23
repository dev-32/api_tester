import 'package:api_tester/screens/main_home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
