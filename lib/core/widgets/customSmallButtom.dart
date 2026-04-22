import 'package:flutter/material.dart';

class CustomSmallButtom extends StatefulWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback onTap;
  const CustomSmallButtom({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  State<CustomSmallButtom> createState() => _CustomSmallButtomState();
}

class _CustomSmallButtomState extends State<CustomSmallButtom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 39,
        height: 28,
        decoration: BoxDecoration(
          color: widget.bgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(widget.icon, size: 16, color: widget.iconColor),
      ),
    );
  }
}
