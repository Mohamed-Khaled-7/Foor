import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/products_cubit.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/presentation/widget/customCard.dart';

class CustomSearchDelegate extends SearchDelegate {
  ProductModel? product;
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

  @override
  Widget buildResults(BuildContext context) {
    context.read<ProductsCubit>().searcheProducts(query);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }
        if (state is SearchedSuccess) {
          final results = state.SearchedProducts;
          if (results.isEmpty) {
            return Center(
              child: Text(
                'No resultls founded',
                style: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
              ),
            );
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
        } else {
          return Center(
            child: Text(
              'No resultls founded',
              style: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
