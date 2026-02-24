import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/auth_cubit.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/presentation/views/login_view.dart';
import 'package:musa/presentation/widget/customButton.dart';
import 'package:musa/presentation/widget/customShowDialog.dart';
import 'package:musa/presentation/widget/customSnakPar.dart';
import 'package:musa/presentation/widget/customTextFormField.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
   late ProfileModel profile;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            LucideIcons.arrowLeft,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialgo(context);
          }
          if (state is AuthError) {
            Navigator.pop(context);
            CustomSnakPar(
              context: context,
              message: state.errMessage,
              backgroundColor: Colors.red,
              icons: LucideIcons.alertTriangle,
            );
          }
          if (state is AuthAuthenticated) {
            Navigator.pop(context);
            var profileBox = Hive.box<ProfileModel>(ProfileBox);
            profileBox.put('currentUser', profile);
            CustomSnakPar(
              context: context,
              message: 'Register Successfully',
              backgroundColor: Colors.green[700],
              icons: LucideIcons.checkCircle,
            );
          }
        },
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Let\'s create your\naccount',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        validator: (data) {
                          if (data == null || data.isEmpty)
                            return 'Enter First Name';
                          return null;
                        },
                        lable: 'First Name',
                        icon: LucideIcons.user,
                        hintText: 'First Name',
                        onChange: (data) => firstName = data,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomTextField(
                        validator: (data) {
                          if (data == null || data.isEmpty)
                            return 'Enter Last Name';
                          return null;
                        },
                        lable: 'Last Name',
                        icon: LucideIcons.user,
                        hintText: 'Last Name',
                        onChange: (data) => lastName = data,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  validator: (data) {
                    if (data == null || data.isEmpty) return 'Enter UserName';
                    return null;
                  },
                  lable: 'UserName',
                  icon: LucideIcons.userCheck,
                  hintText: 'Username',
                  onChange: (data) => userName = data,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  validator: (data) {
                    if (data == null || data.isEmpty) return 'Enter your Email';
                    if (!data.contains('@')) return 'Enter valid Email';
                    return null;
                  },
                  lable: 'Email',
                  icon: LucideIcons.mail,
                  hintText: 'E-Mail',
                  onChange: (data) => email = data,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (data) {
                    if (data == null || data.isEmpty) return 'Enter Password';
                    if (data.length < 8) return 'Min 8 characters';
                    return null;
                  },
                  onChanged: (data) => password = data,
                  obscureText: obscureText,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      LucideIcons.lock,
                      color: Color(0xFF9E9E9E),
                      size: 20,
                    ),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => obscureText = !obscureText),
                      icon: Icon(
                        obscureText ? LucideIcons.eyeOff : LucideIcons.eye,
                      ),
                    ),
                    label: const Text('Password'),
                    labelStyle: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 2.9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: CustomButton(
                    color: 0xFF4C6FFF,
                    text: 'Create account',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        profile = ProfileModel(
                        firstName: firstName!,
                        lastName: lastName!,
                        email: email!,
                        user: userName!,
                      );
                        context.read<AuthCubit>().register(
                          profile,
                          email!,
                          password!,
                        );
                      }
                      
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account? ',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[700],
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, LoginPage.id),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
