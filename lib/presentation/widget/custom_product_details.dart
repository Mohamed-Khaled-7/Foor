import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/presentation/widget/customSmallButtom.dart';
import 'package:musa/presentation/widget/custom_addcard_buttom.dart';

class CustomProductDetails extends StatefulWidget {
  const CustomProductDetails({super.key});
  static final id = 'CustomProductDetails';

  @override
  State<CustomProductDetails> createState() => _CustomProductDetailsState();
}

class _CustomProductDetailsState extends State<CustomProductDetails> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Stack(
        children: [
          Container(
            height: 478,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/150?img=8'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 456),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              child: BottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                backgroundColor: Colors.white,
                onClosing: () {},
                builder: (context) => Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, top: 29),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Product Name',
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  height: 50,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[300],
                                  ),
                                  child: Icon(LucideIcons.heart),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            '⭐  4.8(300Reviews)',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 23),
                        Text(
                          'Details for Product it will be displayed here',
                          style: GoogleFonts.montserrat(fontSize: 17),
                        ),
                        SizedBox(height: 55),
                        Row(
                          children: [
                            Text(
                              'Choose amount: ',
                              style: GoogleFonts.montserrat(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 100),
                            Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xffDDDBDC),
                                shape: BoxShape.rectangle,
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
                                        index--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '$index',
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 8),
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
                        SizedBox(height: 55),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            'Price',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text(
                                '\$234',
                                style: GoogleFonts.poppins(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 111),
                            CustomAddCardButton(onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
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
