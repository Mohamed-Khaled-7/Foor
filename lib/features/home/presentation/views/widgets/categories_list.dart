import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musa/features/home/presentation/cubit/cubit/category_cubit.dart';
import 'package:musa/features/home/presentation/views/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: Text('Loading....'));
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: 130,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CategoryItem(categoryEntity: state.categories[index]),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
            ),
          );
        } else {
          return Center(
            child: Text(
              'Loading......',
              style: GoogleFonts.poppins(fontSize: 23),
            ),
          );
        }
      },
    );
  }
}
