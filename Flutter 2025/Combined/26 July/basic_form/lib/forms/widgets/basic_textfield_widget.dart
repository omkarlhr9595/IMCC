import 'package:flutter/material.dart';

class BasicTextfieldWidget extends StatefulWidget {
  const BasicTextfieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  State<BasicTextfieldWidget> createState() => _BasicTextfieldWidgetState();
}

class _BasicTextfieldWidgetState extends State<BasicTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
    );
  }
}
