import 'package:flutter/material.dart';

class TextFieldCostem extends StatelessWidget {
  final TextEditingController? numberController;
  final String ?text;


  TextFieldCostem(this.numberController, this.text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: numberController,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
       labelText: '',
      ),
    );
  }
}
