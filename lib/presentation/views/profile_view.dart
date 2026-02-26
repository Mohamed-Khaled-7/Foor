import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/profile_cubit.dart';
import 'package:musa/presentation/widget/profile_body.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'EditProfile',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(LucideIcons.edit, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20,
                ),
                child: LinearProgressIndicator(
                  minHeight: 8, 
                  backgroundColor: Colors.grey[300], 
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blueAccent,
                  ), 
                ),
              ),
            );
          }
          if (state is ProfileLoaded) {
            return ProfileBody(profile: state.profileModel);
          }
          if (state is ProfileError) {
            return Text('Error ${state.errMessage}');
          } else {
            return Text('$e');
          }
        },
      ),
    );
  }
}
