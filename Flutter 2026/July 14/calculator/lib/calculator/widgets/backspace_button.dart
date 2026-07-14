import 'package:flutter/material.dart';

class BackspaceButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackspaceButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.backspace,
            color: Colors.grey[700],
            size: 24,
          ),
        ),
      ),
    );
  }
}
