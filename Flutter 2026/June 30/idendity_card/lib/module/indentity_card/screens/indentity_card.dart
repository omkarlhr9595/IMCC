import 'package:flutter/material.dart';
import 'package:idendity_card/module/indentity_card/widgets/profile_photo.dart';

class IndentityCardScreen extends StatelessWidget {
  const IndentityCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Indentity Card',
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              ProfilePhotoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
