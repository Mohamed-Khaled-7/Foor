import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/business_logic/cubit/categories_cubit.dart';
import 'package:musa/business_logic/cubit/products_cubit.dart';
import 'package:musa/presentation/widget/categoryItem.dart';
import 'package:shimmer/shimmer.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
    void initState() {
  super.initState();
  context.read<CategoriesCubit>().getAllCategories();
}
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
          final firstCategorie = state.categories.first;
          context.read<ProductsCubit>().getAllProducts(url: 'https://dummyjson.com/products');
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
        
          return Shimmer(
            child: Container(height: 100, width: 100),
            gradient: const LinearGradient(colors: [Colors.grey, Colors.white]),
          );
        }
      },
    );
  }
}
