import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/presentation/widget/customSmallButtom.dart';
import 'package:musa/presentation/widget/custom_addcard_buttom.dart';

class CustomProductDetails extends StatefulWidget {
  CustomProductDetails({super.key});
  static final id = 'CustomProductDetails';

  @override
  State<CustomProductDetails> createState() => _CustomProductDetailsState();
}

class _CustomProductDetailsState extends State<CustomProductDetails> {
  int index = 1;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      backgroundColor: Colors.white38,
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productModel.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(LucideIcons.arrowLeft),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 301),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 29, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              productModel.title,
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: IconButton(
                              icon: isFav
                                  ? Icon(Icons.favorite, color: Colors.red)
                                  : Icon(LucideIcons.heart),
                              onPressed: () {
                                setState(() {
                                  isFav = !isFav;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      /// RATING
                      Text(
                        '⭐ ${productModel.rating}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 23),

                      /// DESCRIPTION
                      Text(
                        productModel.description,
                        style: GoogleFonts.montserrat(fontSize: 17),
                      ),

                      const SizedBox(height: 20),

                      /// AMOUNT
                      Row(
                        children: [
                          Text(
                            'Choose amount:',
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xffDDDBDC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                CustomSmallButtom(
                                  icon: LucideIcons.minus,
                                  bgColor: Colors.white,
                                  iconColor: Colors.black,
                                  onTap: () {
                                    setState(() {
                                      if (index > 0) index--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '$index',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CustomSmallButtom(
                                  icon: LucideIcons.plus,
                                  bgColor: Colors.black,
                                  iconColor: Colors.white,
                                  onTap: () {
                                    setState(() {
                                      index++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// PRICE SMALL
                      Text(
                        '\$${productModel.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// PRICE + ADD TO CART
                      Row(
                        children: [
                          Text(
                            '\$${productModel.price}',
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          CustomAddCardButton(onPressed: () {}),
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
