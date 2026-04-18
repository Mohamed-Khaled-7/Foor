import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/core/const/const.dart';
import 'package:musa/features/favoriate/presentation/views/widgets/custom_cart.dart';
import 'package:musa/features/products/data/models/product_model.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(LucideIcons.heart))],
        title: Text(
          'Favoriates Page',
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ProductModel>(FavoritesBox).listenable(),
        builder: (context, Box<ProductModel> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text(
                'No Favorites Items!',
                style: GoogleFonts.poppins(fontSize: 23),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                final favoriteItem = box.values.toList()[index];
                return CustomFavoriateCard(product: favoriteItem);
              },
            );
          }
        },
      ),
    );
  }
}
