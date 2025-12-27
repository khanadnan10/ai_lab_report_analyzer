// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabledBorders = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool enabledBorders;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                side: enabledBorders ? BorderSide(width: 0.5) : BorderSide.none,
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
