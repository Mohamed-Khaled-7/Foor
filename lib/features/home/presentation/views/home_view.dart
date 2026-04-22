import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/features/cart/presentation/views/widgets/customAppBar.dart';
import 'package:musa/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:musa/features/home/presentation/views/widgets/categories_list.dart';
import 'package:musa/features/home/presentation/views/widgets/customHeader.dart';
import 'package:musa/features/home/presentation/views/widgets/customSearchField.dart';
import 'package:musa/features/home/presentation/views/widgets/custom_list_products.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CustomSearch(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 18),
                CustomHeader(title: 'Categories'),
                SizedBox(height: 16),
                CategoryList(),
                SizedBox(height: 23),
                CustomHeader(title: 'Products'),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return CustomListProducts();
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
