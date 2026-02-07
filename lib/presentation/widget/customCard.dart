import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomCard extends StatefulWidget {
  CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}
class _CustomCardState extends State<CustomCard> {
  bool isFavorit = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 24, right: 18),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 130,
              width: 180,
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          'Title',
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
                              'Price',
                              style: GoogleFonts.montserrat(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorit = !isFavorit;
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
              left: 0,
              top: 12,
              bottom: 122,
              right: 120,
              child: Image.asset(
                'assets/images/secondOnBoard.png',
                height: 22,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
