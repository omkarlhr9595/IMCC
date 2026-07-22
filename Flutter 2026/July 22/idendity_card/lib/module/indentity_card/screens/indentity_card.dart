import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idendity_card/module/indentity_card/widgets/info_row.dart';
import 'package:idendity_card/module/indentity_card/widgets/profile_photo.dart';

class IndentityCardScreen extends StatelessWidget {
  const IndentityCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Indentity Card',
          style: GoogleFonts.eduNswActFoundation(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
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
              InfoRowWidget(
                title: 'Full Name',
                value: 'John Doe',
              ),
              InfoRowWidget(
                title: 'Class',
                value: 'MCA',
              ),
              InfoRowWidget(
                title: 'Roll No',
                value: '1234567890',
              ),
              InfoRowWidget(
                title: 'Year',
                value: '2026',
              ),
              InfoRowWidget(
                title: 'Department',
                value: 'Computer Science',
              ),
              InfoRowWidget(
                title: 'College',
                value: 'University of Pune',
              ),
              InfoRowWidget(
                title: 'Address',
                value: 'Pune, Maharashtra, India',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
