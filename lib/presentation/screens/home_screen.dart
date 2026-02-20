
import 'package:flutter/material.dart';
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
    return Scaffold(
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
    );
  }
}
