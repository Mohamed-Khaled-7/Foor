import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/data/models/poductModel.dart';

class CustomCard extends StatefulWidget {
  List<Productmodel> wishItems = [];
  Productmodel Product;
  CustomCard({Key? key, required this.Product}) : super(key: key);
  @override
  
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorit = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'upDatePage', arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Card(
              clipBehavior: Clip.none,
              color: Colors.white,
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Text(
                        widget.Product.title.substring(0, 7),
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: .0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.Product.price}',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorit = !isFavorit;
                                if(isFavorit){
                                  widget.wishItems.add(widget.Product);
                                }else{
                                  widget. wishItems.remove(widget.Product);
                                }
                              });
                            },
                            icon: isFavorit
                                ? Icon(Icons.favorite, color: Colors.red)
                                : Icon(LucideIcons.heart, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 97,
            right: 12,
            child: Image.network(width: 112, height: 89, widget.Product.image),
          ),
        ],
      ),
    );
  }
}
