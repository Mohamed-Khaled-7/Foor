// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    Key? key,
    required this.formKey,
    required this.autoValidateMode,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          onCreditCardWidgetChange: (_) {},
          cardBgColor: const Color(0xFF1F4A82),
          glassmorphismConfig: null,
          isHolderNameVisible: true,
          isSwipeGestureEnabled: true,
        ),
        CreditCardForm(
          autovalidateMode: widget.autoValidateMode,
          formKey: widget.formKey,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel model) {
            setState(() {
              cardNumber = model.cardNumber;
              expiryDate = model.expiryDate;
              cardHolderName = model.cardHolderName;
              cvvCode = model.cvvCode;
              isCvvFocused = model.isCvvFocused;
            });
          },
        ),
      ],
    );
  }
}
