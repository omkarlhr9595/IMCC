import 'package:basic_form/forms/widgets/basic_textfield_widget.dart';
import 'package:basic_form/forms/widgets/email_field_widget.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _basicTextController = TextEditingController();
  final _emailController = TextEditingController();


  String? _name;
  String? _email;


  void _submit() {
    if (_formKey.currentState!.validate()) {
      print('Form is valid');
    }
  }


  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _basicTextController.dispose();
    _emailController.dispose();
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
                const SizedBox(height: 16),
                BasicTextfieldWidget(
                  controller: _basicTextController,
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                const SizedBox(height: 16),
                EmailFieldWidget(
                  controller: _emailController,
                  onChanged: (value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
