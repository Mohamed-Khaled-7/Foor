import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/business_logic/cubit/categories_cubit.dart';
import 'package:musa/presentation/widget/categoryItem.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 23, 51, 214),
            ),
          );
        } else if (state is CategoriesLoaded) {
          return SizedBox(
            height: 130,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CategoryItem(categoryModel: state.categories[index]),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }
      },
    );
  }
}
