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
    context.read<ProfileCubit>().profileData();
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
          if (state is ProfileLoaded) {
            return ProfileBody(profile: state.profileModel);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
