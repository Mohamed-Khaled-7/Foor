import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:musa/features/home/presentation/views/widgets/custom_product_card.dart';


class CustomSearchDelegate extends SearchDelegate {
  Product? product;
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
        context.read<HomeCubit>().getAllProducts(),
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    context.read<HomeCubit>().searchProducts(query:query);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }
        if (state is SearchLoaded) {
          final results = state.results;
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
                key: ValueKey(results[index].id),
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