import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/cart_cubit.dart';
import 'package:musa/presentation/widget/cart_body.dart';
import 'package:musa/presentation/widget/customCartButton.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static final id = 'BageView';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchAllCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Bage', style: GoogleFonts.poppins(fontSize: 30)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.shoppingBag)),
        ],
      ),
      body: CartBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return CustomCartButton(
              text: 'Checkout',
              totalPrice: context.read<CartCubit>().totalPrice(),
              color: 0xFF000000,
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }
}
