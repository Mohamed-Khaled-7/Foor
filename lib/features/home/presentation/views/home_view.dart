import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/features/cart/presentation/views/widgets/customAppBar.dart';
import 'package:musa/features/home/presentation/cubit/cubit/products_cubit.dart';
import 'package:musa/features/home/presentation/views/widgets/categories_list.dart';
import 'package:musa/features/home/presentation/views/widgets/customHeader.dart';
import 'package:musa/features/home/presentation/views/widgets/customSearchField.dart';
import 'package:musa/features/home/presentation/views/widgets/custom_list_products.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const CustomSearch(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 18),
                const CustomHeader(title: 'Categories'),
                SizedBox(height: 16),
                const CategoryList(),
                const SizedBox(height: 23),
                const CustomHeader(title: 'Products'),
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return const CustomListProducts();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
