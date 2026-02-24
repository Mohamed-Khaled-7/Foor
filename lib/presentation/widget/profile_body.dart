import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/auth_cubit.dart';
import 'package:musa/business_logic/cubit/profile_cubit.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/presentation/widget/customButton.dart';
import 'package:musa/presentation/widget/customTextFormField.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({super.key, required this.profile});
  final ProfileModel profile;
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController userController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.profile.firstName);
    lastNameController = TextEditingController(text: widget.profile.lastName);
    nameController = TextEditingController(
      text: '${widget.profile.firstName} ${widget.profile.lastName}',
    );
    emailController = TextEditingController(text: widget.profile.email);
    userController = TextEditingController(text: widget.profile.user);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  border: Border.all(color: Colors.blueAccent, width: 2),
                ),
                child: ClipOval(
                  child: widget.profile.image != null
                      ? CachedNetworkImage(
                          imageUrl: widget.profile.image!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person, size: 50),
                        )
                      : const Icon(Icons.person, size: 50),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    context.read<ProfileCubit>().updateProfileImage();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 20,
                    child: Icon(
                      LucideIcons.camera,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            nameController.text,
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
                  onChange: (data) {
                    setState(() {
                      nameController.text = '$data ${lastNameController.text}';
                    });
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
                  onChange: (data) {
                    setState(() {
                      nameController.text = '${firstNameController.text} $data';
                    });
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
                  image: widget.profile.image,
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
            context.read<AuthCubit>().logOut();
          },
          icon: const Icon(LucideIcons.logOut, color: Colors.red),
        ),
      ],
    );
  }
}
