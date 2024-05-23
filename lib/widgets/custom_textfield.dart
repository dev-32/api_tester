import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.headingText, required this.hintText, required this.inputText,
   this.height =55});
  final String headingText;
  final TextEditingController inputText;
  final String hintText;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headingText, style: const TextStyle(
            color: Colors.grey
        )),
        const SizedBox(height: 10),
        Container(
          height: height.toDouble(),
          width: MediaQuery.of(context).size.width*0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.orange, width: 2),
          ),
          child: TextFormField(
            onChanged: (value) {
              inputText.text = value;
            },
            maxLines: 10,
            controller: inputText,
            decoration:  InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.grey
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        )
      ],
    );
  }
}
