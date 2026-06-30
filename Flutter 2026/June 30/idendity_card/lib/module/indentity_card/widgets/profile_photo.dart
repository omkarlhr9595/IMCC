import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String profilePhotoUrl = 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/09/12/17/potter.jpg?width=1200';
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(150),
      ),
      child: ClipOval(
        child: Image.network(
          profilePhotoUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
