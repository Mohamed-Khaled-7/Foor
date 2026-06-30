import 'dart:ui';

import 'package:flutter/material.dart';

class MethodButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  const MethodButton({
    required this.selected,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? const Color(0xFF4CAF50) : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
