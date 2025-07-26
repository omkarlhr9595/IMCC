import 'package:basic_form/forms/widgets/basic_textfield_widget.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _basicTextController = TextEditingController();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _basicTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BasicTextfieldWidget(
                  controller: _basicTextController,
                  onChanged: (value) {
                    print(value);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
