import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/favoriate_cubit.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomCard extends StatefulWidget {
  CustomCard({Key? key, required this.product}) : super(key: key);
  ProductModel product;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  

  @override
  Widget build(BuildContext context) {
    
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 28,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 3,
                      right: 4,
                      top: 3,
                      bottom: 4,
                    ),
                    child: Text(
                      '${widget.product.discountPercentage}%',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 220,
                          width: 170,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image),
                      fit: BoxFit.cover,
                      imageUrl: '${widget.product.thumbnail}',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.product.price.toString()}',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                   BlocBuilder<FavoriateCubit, FavoriateState>(
                      
                      builder: (context,state) {
                       var isFav =context.read<FavoriateCubit>().isFav(widget.product);
                        return GestureDetector(
                          onTap: () =>
                              context.read<FavoriateCubit>().addOrRemoveFav(widget.product),
                          child: Icon(
                            isFav ? Icons.favorite : LucideIcons.heart,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
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
    );
  }
}
