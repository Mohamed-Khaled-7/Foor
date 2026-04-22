import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/core/widgets/customButton.dart';
import 'package:musa/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:musa/features/profile/data/models/profile_model.dart';
import 'package:musa/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:musa/presentation/widget/customTextFormField.dart';


class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key, required this.profile});
  final ProfileModel profile;
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController userController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.profile.firstName);
    lastNameController = TextEditingController(text: widget.profile.lastName);

    emailController = TextEditingController(text: widget.profile.email);
    userController = TextEditingController(text: widget.profile.user);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();

    emailController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is ProfileError)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
        if(state is ProfileLoaded)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully!')),
          );
        }
        if(state is ProfileLoading)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Updating profile...')),
          );
        }
      },
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 3),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person, size: 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              '${firstNameController.text} ${lastNameController.text}',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 8, top: 16),
                  child: CustomTextField(
                    controller: firstNameController,
                    onChange: (_) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 27, top: 16),
                  child: CustomTextField(
                    enabled: true,
                    controller: lastNameController,
                    onChange: (_) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 28, right: 20),
            child: CustomTextField(
              controller: userController,
              onChange: (data) {},
              color: 0x00000000,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 28, right: 20),
            child: CustomTextField(
              enabled: false,
              controller: emailController,
              onChange: (data) {},
              color: 0x00000000,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: CustomButton(
                onPressed: () {
                  final updatedProfile = widget.profile.copyWith(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    user: userController.text,
                  );
                  context.read<ProfileCubit>().updateProfile(updatedProfile);
                },
                text: 'Save Changes',
                color: Colors.blueAccent.value,
              ),
            ),
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            icon: const Icon(LucideIcons.logOut, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
