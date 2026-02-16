import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/cart_cubit.dart';

import 'package:musa/data/models/product_model.dart';
import 'package:musa/presentation/widget/customSmallButtom.dart';

import 'package:shimmer/shimmer.dart';

class CustomCartCard extends StatefulWidget {
  CustomCartCard({Key? key, required this.product}) : super(key: key);
  ProductModel product;
  @override
  State<CustomCartCard> createState() => _CustomCartCardState();
}

class _CustomCartCardState extends State<CustomCartCard> {
  bool isFav = false;
  var totalPriceForProduct = 0.0;
  @override
  Widget build(BuildContext context) {
    totalPriceForProduct = widget.product.quantity * widget.product.price;
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            'CustomProductDetails',
            arguments: widget.product,
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
                imageUrl: widget.product.thumbnail,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
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
                        context.read<CartCubit>().decreaseCart(widget.product);
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${widget.product.quantity}',
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
                        context.read<CartCubit>().addCart(widget.product);
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
          ],
        ),
      ),
    );
  }
}
