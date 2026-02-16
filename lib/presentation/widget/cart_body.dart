import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/cart_cubit.dart';
import 'package:musa/presentation/widget/customCard.dart';
import 'package:musa/presentation/widget/custom_cart_card.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartEmpty) {
          Text(
            'No items in your bage!',
            style: GoogleFonts.poppins(fontSize: 23, color: Colors.black),
          );
        }
      },
      builder: (context, state) {
        if (state is CartLoaded) {
          final item = state.cartItems;
          final itemLenth = state.cartItems.length;
          return ListView.builder(
            itemCount: itemLenth,
            itemBuilder: (context, index) {
              return CustomCartCard(product: item[index]);
            },
          );
        } else {
          return Center(
            child: Text(
              'No items in your bage!',
              style: GoogleFonts.poppins(fontSize: 27),
            ),
          );
        }
      },
    );
  }
}
