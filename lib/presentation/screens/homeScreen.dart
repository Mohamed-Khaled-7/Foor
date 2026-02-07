import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:musa/data/models/poductModel.dart';
import 'package:musa/presentation/widget/categoriesList.dart';
import 'package:musa/presentation/widget/customAppBar.dart';

import 'package:musa/presentation/widget/customHeader.dart';
import 'package:musa/presentation/widget/customSearchField.dart';
import 'package:musa/presentation/widget/customCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Productmodel>> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: 23),
          SizedBox(height: 23),
          CustomTextSearch(),
          SizedBox(height: 18),
          CustomHeader(title: 'Categories'),
          SizedBox(height: 16),
          CategoryList(),
          SizedBox(height: 23),
          CustomHeader(title: 'Products'),
          CustomCard(),
        ],
      ),
    );
  }
}
