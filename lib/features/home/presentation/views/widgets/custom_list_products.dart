import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musa/features/home/presentation/cubit/cubit/products_cubit.dart';
import 'package:musa/features/home/presentation/views/widgets/custom_product_card.dart';
import 'package:shimmer/shimmer.dart';

class CustomListProducts extends StatelessWidget {
  const CustomListProducts({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
            child: Text(
              'Loading....',
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          );
        }
        if (state is ProductsLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return CustomCard(product: state.products[index]);
            },
            itemCount: state.products.length,
          );
        }
        if (state is ProductsError) {
          return Center(child: Text(state.errMessage));
        } else {
          return Shimmer(
            child: Container(height: 120, width: 90),
            gradient: const LinearGradient(
              colors: [Colors.grey, Colors.white24],
            ),
          );
        }
      },
    );
  }
}
