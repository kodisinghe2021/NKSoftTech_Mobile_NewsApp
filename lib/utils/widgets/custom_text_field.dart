import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.lable,
    required this.controller,
    this.isObsecure = false,
  }) : super(key: key);

  final String lable;
  final bool isObsecure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        labelText: lable,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5),
        //   borderSide: const BorderSide(color: Colors.blueGrey),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5),
        //   borderSide: const BorderSide(color: Colors.blueAccent),
        // ),
      ),
    );
  }
}
