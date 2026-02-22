import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/products_cubit.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/presentation/widget/customCard.dart';

class CustomSearchDelegate extends SearchDelegate {
  ProductModel? product;
  List<ProductModel> results = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(LucideIcons.x))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(LucideIcons.arrowLeft),
      onPressed: () => {
        close(context, null),
        context.read<ProductsCubit>().getAllProducts(
          url: 'https://dummyjson.com/products',
        ),
      },
    );
  }

  void search(BuildContext context) {
    context.read<ProductsCubit>().searcheProducts(query);
    results = context.read<ProductsCubit>().productsSearched;
  }

  @override
  Widget buildResults(BuildContext context) {
    search(context);
    if (results.isEmpty) {
      return Center(
        child: Text(
          'No resultls founded',
          style: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
        ),
      );
    } else {
      results = results
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CustomCard(
          product: results[index],
          key: ValueKey(results[index].key),
        );
      },
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
