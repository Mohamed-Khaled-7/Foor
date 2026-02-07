import 'package:flutter/material.dart';
import 'package:musa/presentation/widget/customCard.dart';

class CustomListProducts extends StatelessWidget {
  const CustomListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return CustomCard();
      },
      itemCount: 10,
    );
  }
}
