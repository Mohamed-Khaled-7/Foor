import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/cart_cubit.dart';
import 'package:musa/business_logic/cubit/profile_cubit.dart';
import 'package:musa/presentation/views/cart_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: Icon(LucideIcons.shoppingBag),
                onPressed: () {
                  Navigator.pushNamed(context, CartView.id);
                },
              ),

              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  var count = context.read<CartCubit>().getItemCount();
                  return count == 0
                      ? SizedBox()
                      : Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: Text(
                              count,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ],
      title: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var name = context.read<ProfileCubit>().getName() ?? 'user';
          return Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=3',
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Hello, $name!',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
