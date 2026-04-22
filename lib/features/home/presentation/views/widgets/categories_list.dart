import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musa/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:musa/features/home/presentation/views/widgets/category_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: Text('Loading....'));
        } else if (state is HomeLoaded) {
          context.read<HomeCubit>().getProductsByCategory(
            url: 'https://dummyjson.com/products',
          );
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
