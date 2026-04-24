import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/core/utils/app_routers.dart';
import 'package:musa/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:musa/presentation/widget/customSmallButtom.dart';
import 'package:shimmer/shimmer.dart';

class CustomCartCard extends StatelessWidget {
  CustomCartCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  final bool isFav = false;
  var totalPriceForProduct = 0.0;
  @override
  Widget build(BuildContext context) {
    totalPriceForProduct = product.quantity * product.price;
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushReplacement(
            AppRouters.productDetailsView,
            extra: product,
          );
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 80,
                width: 80,
                imageUrl: product.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: Colors.black,

                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CustomSmallButtom(
                        icon: LucideIcons.minus,
                        bgColor: Colors.black54,
                        iconColor: Colors.white,
                        onTap: () {
                          context.read<CartCubit>().decreaseCart(
                            product,
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${product.quantity}',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      CustomSmallButtom(
                        icon: LucideIcons.plus,
                        bgColor: Colors.blueAccent,
                        iconColor: Colors.white,
                        onTap: () {
                          context.read<CartCubit>().addCart(product);
                        },
                      ),
                      SizedBox(width: 88),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          '\$${totalPriceForProduct.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
