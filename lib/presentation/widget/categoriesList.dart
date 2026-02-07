import 'package:flutter/material.dart';
import 'package:musa/presentation/widget/categoryItem.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: 10,
          ),
          child: CategoryItem(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
