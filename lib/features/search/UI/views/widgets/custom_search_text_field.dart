import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  OutlineInputBorder _buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.all(Radius.circular(5.5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        hintText: "Search...",
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.deepPurpleAccent,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.deepPurpleAccent[50],
        labelText: "Search",
        labelStyle: const TextStyle(color: Colors.deepPurpleAccent),
      ),
    );
  }
}
