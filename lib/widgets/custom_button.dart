import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.40,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(7),
      ),
      child:  Center(
        child: Text(buttonText, style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),),
      ),
    );
  }
}
