import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/core/widgets/customSnakPar.dart';
import 'package:musa/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:musa/features/cart/presentation/views/widgets/custom_addcard_buttom.dart';
import 'package:musa/features/favoriate/domain/entites/favoriate.dart';
import 'package:musa/features/favoriate/presentation/cubit/cubit/favoriate_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({required this.product, super.key});
  final int index = 1;
   final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Hero(
            tag: product.id,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: SafeArea(
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.7),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(LucideIcons.arrowLeft, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 366),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          BlocBuilder<FavoriateCubit, FavoriateState>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<FavoriateCubit>().addOrRemoveFav(
                                    product,
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    context.read<FavoriateCubit>().isFav(
                                          product,
                                        )
                                        ? Icons.favorite
                                        : LucideIcons.heart,
                                    color:
                                        context.read<FavoriateCubit>().isFav(
                                          product,
                                        )
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${product.rating}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '\$${product.price}',
                                style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CustomAddCardButton(
                            onPressed: () {
                              context.read<CartCubit>().addCart(product);
                              CustomSnakPar(
                                context: context,
                                message: 'Added to cart!',
                                backgroundColor: Colors.green[700],
                                icons: LucideIcons.checkCircle,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
