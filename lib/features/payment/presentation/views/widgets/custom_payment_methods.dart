import 'package:flutter/material.dart';
import 'package:musa/features/payment/presentation/views/widgets/method_button.dart';

class CustomPaymentMethods extends StatefulWidget {
  const CustomPaymentMethods({super.key});

  @override
  State<CustomPaymentMethods> createState() => _CustomPaymentMethodsState();
}

class _CustomPaymentMethodsState extends State<CustomPaymentMethods> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MethodButton(
          selected: _selectedMethod == 0,
          onTap: () => setState(() => _selectedMethod = 0),
          child: const Icon(Icons.credit_card, size: 26, color: Colors.black54),
        ),
        const SizedBox(width: 12),
        MethodButton(
          selected: _selectedMethod == 1,
          onTap: () => setState(() => _selectedMethod = 1),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'P',
                  style: TextStyle(
                    color: Color(0xFF003087),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: 'ay',
                  style: TextStyle(color: Color(0xFF003087), fontSize: 16),
                ),
                TextSpan(
                  text: 'Pal',
                  style: TextStyle(color: Color(0xFF009CDE), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        MethodButton(
          selected: _selectedMethod == 2,
          onTap: () => setState(() => _selectedMethod = 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.apple, size: 20, color: Colors.black),
              SizedBox(width: 3),
              Text(
                'Pay',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
