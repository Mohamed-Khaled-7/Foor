import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/cart_cubit.dart';
import 'package:musa/business_logic/cubit/favoriate_cubit.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/datasource/local/favoriate_local_datasoure.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/data/repository/favoriate_repository.dart';
import 'package:musa/presentation/widget/customSmallButtom.dart';
import 'package:musa/presentation/widget/customSnakPar.dart';
import 'package:musa/presentation/widget/custom_addcard_buttom.dart';

class CustomProductDetails extends StatefulWidget {
  CustomProductDetails({super.key});
  static final id = 'CustomProductDetails';

  @override
  State<CustomProductDetails> createState() => _CustomProductDetailsState();
}

class _CustomProductDetailsState extends State<CustomProductDetails> {
  int index = 1;
  FavoriateRepository favoriateRepository = FavoriateRepository(
    favoriateLocalDatasoure: FavoriateLocalDatasoure(),
  );

  @override
  Widget build(BuildContext context) {
    ProductModel? productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel?;
    if (productModel == null) {
      throw ArgumentError('ProductModel is null in CustomProductDetails');
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Hero(
            tag: productModel.id,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productModel.thumbnail),
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
                backgroundColor: Colors.white.withOpacity(0.7),
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
                              productModel.title,
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
                                    productModel,
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
                                          productModel,
                                        )
                                        ? Icons.favorite
                                        : LucideIcons.heart,
                                    color:
                                        context.read<FavoriateCubit>().isFav(
                                          productModel,
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
                            '${productModel.rating}',
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
                        productModel.description,
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
                                '\$${productModel.price}',
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
                              context.read<CartCubit>().addCart(productModel);
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
