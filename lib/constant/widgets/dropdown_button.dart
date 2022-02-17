import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton(
      {Key? key, this.onChanged, this.nameFiled,required this.hint})
      : super(key: key);

  final Function(String?)? onChanged;

  final String? nameFiled;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint:  Text(hint),
      value: nameFiled,
      items: ['USD', 'EGP', 'EUR', 'JPY'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 20,
      ),
    );
  }
}
