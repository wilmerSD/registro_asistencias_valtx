import 'package:flutter/material.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({
    Key? key,
    required this.text,
    required this.size,
    required this.colors,
    required this.alignment,
  }) : super(key: key);
  final String text;
  final double size;
  final Color colors;
  final TextAlign alignment;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        fontSize: size,
        color: colors,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
