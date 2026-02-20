import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/profile_cubit.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/presentation/widget/customButton.dart';
import 'package:musa/presentation/widget/customSnakPar.dart';
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

   String ?firstName;
   String? lastName;
   String? email;
   String? user;
  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: SizedBox(
            child: CachedNetworkImage(
              width: 200,
              height: 200,
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/847/847969.png',
            ),
          ),
        ),
        Center(
          child: SafeArea(
            child: Text(
              '${nameController.text}',
              style: GoogleFonts.poppins(fontSize: 22),
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
                    nameController.text =
                        '$firstName ${lastNameController.text}';
                    setState() {}
                  },
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 27, top: 16),
                child: CustomTextField(
                  controller: lastNameController,
                  onChange: (data) {
                    lastName = data;
                    nameController.text =
                        '${firstNameController.text} $lastName';
                    setState() {}
                  },
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 28, right: 20),
          child: CustomTextField(
            onChange: (data) {
              user = data;
            },
            controller: userController,
            color: 0x00000000,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 28, right: 20),
          child: CustomTextField(
            onChange: (data) {
              email = data;
            },
            controller: emailController,
            color: 0x00000000,
          ),
        ),
        SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: CustomButton(
              onPressed: () {
                final updateProfile = ProfileModel(
                  firstName: firstNameController.text.isEmpty
                      ? firstName!
                      : firstNameController.text,
                  lastName: lastNameController.text.isEmpty
                      ? lastName!
                      : lastNameController.text,
                  email: emailController.text.isEmpty
                      ? email!
                      : emailController.text,
                  user: userController.text.isEmpty
                      ? user!
                      : userController.text,
                  image: widget.profile.image,
                );
                BlocProvider.of<ProfileCubit>(
                  context,
                ).updateProfile(updateProfile);
                CustomSnakPar(
                  context: context,
                  message: 'Profile Updated Successfully',
                  backgroundColor: Colors.green,
                  icons: Icons.check_circle_outline,
                );
              },
              text: 'Save Changes',
              color: Colors.blueAccent.value,
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(LucideIcons.logOut)),
      ],
    );
  }
}
