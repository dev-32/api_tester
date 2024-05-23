import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

class JsonBeautifier extends StatelessWidget {
  const JsonBeautifier({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: JsonView.string(
       data,
        theme: JsonViewTheme(
          backgroundColor: Colors.blueGrey.shade800,
        keyStyle: TextStyle(
        color: Colors.deepOrange.shade300,
          fontSize: 16,
          fontFamily: 'monospace',
          fontWeight: FontWeight.w600,
      ),
      doubleStyle: const TextStyle(
      color: Colors.greenAccent,
        fontFamily: 'monospace',
      fontSize: 16,
      ),
      intStyle: TextStyle(
      color: Colors.red.shade200,
        fontFamily: 'monospace',
      fontSize: 16,
      ),
      stringStyle: const TextStyle(
      color: Colors.greenAccent,
        fontFamily: 'monospace',
      fontSize: 16,
      ),
      boolStyle: const TextStyle(
      color: Colors.orange,
        fontFamily: 'monospace',
      fontSize: 16,
      ),
      closeIcon: Icon(
      Icons.remove_circle,
      color: Colors.pinkAccent.shade100,
      size: 20,
      ),
      openIcon: const Icon(
      Icons.add_circle_rounded,
      color: Colors.teal,
      size: 20,
      ),
      separator: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(
      Icons.arrow_right_alt_outlined,
      size: 20,
      color: Colors.yellowAccent,
      ),
      ),
        ),
      ),
    );
  }
}
