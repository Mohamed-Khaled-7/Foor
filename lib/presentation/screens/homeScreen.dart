import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musa/business_logic/cubit/categories_cubit.dart';
import 'package:musa/data/repository/get_all_categories_repo.dart';
import 'package:musa/data/services/get_all_categories.dart';

import 'package:musa/presentation/widget/categoriesList.dart';
import 'package:musa/presentation/widget/customAppBar.dart';
import 'package:musa/presentation/widget/customHeader.dart';
import 'package:musa/presentation/widget/customSearchField.dart';
import 'package:musa/presentation/widget/custom_list_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => CategoriesCubit(
        categoriesRepository: CategoriesRepository(
          getAllCategoriesServices: GetAllCategoriesServices(),
        ),
      )..getAllCategories(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            CustomTextSearch(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 18),
                  CustomHeader(title: 'Categorie'),
                  SizedBox(height: 16),
                  CategoryList(),
                  SizedBox(height: 23),
                  CustomHeader(title: 'Products'),
                  CustomListProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
