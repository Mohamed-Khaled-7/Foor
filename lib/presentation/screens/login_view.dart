import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/auth_cubit.dart';
import 'package:musa/presentation/screens/navigation_view.dart';
import 'package:musa/presentation/screens/register_view.dart';
import 'package:musa/presentation/widget/customButton.dart';
import 'package:musa/presentation/widget/customShowDialog.dart';
import 'package:musa/presentation/widget/customSnakPar.dart';
import 'package:musa/presentation/widget/customTextFormField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPagejState();
}

class _LoginPagejState extends State<LoginPage> {
  late String? email;

  late String? password;

  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialgo(context);
          } else {
            Navigator.pop(context);
          }
          if (state is AuthAuthenticated) {
            CustomSnakPar(
              context: context,
              message: 'Login Successfully',
              backgroundColor: Colors.green[700],
              icons: LucideIcons.checkCircle,
            );
            Navigator.pushNamed(context, NavigationView.id);
          }
          if(state is AuthError)
          {
            CustomSnakPar(
              context: context,
              message: state.errMessage,
              backgroundColor: Colors.red[700],
              icons: LucideIcons.xCircle,
            );
          }
        },
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 121),
                  child: Text(
                    textAlign: TextAlign.left,
                    ' Welcome  \n Back!',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                    left: 16,
                    right: 16,
                    top: 3,
                  ),
                  child: CustomTextField(
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Please enter your email';
                      } else if (!data.contains('@')) {
                        return 'enter valid email';
                      }
                    },
                    lable: 'Email',
                    icon: LucideIcons.mail,
                    hintText: 'E-Mail',
                    onChange: (data) {
                      email = data;
                    },
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                    left: 16,
                    right: 16,
                    top: 3,
                  ),
                  child: TextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Please enter your password';
                      }
                    },
                    obscureText: obscureText,
                    style: GoogleFonts.poppins(color: Colors.black),
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      prefixIcon: Icon(
                        LucideIcons.lock,
                        color: Colors.black,
                        size: 20,
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: obscureText
                            ? Icon(LucideIcons.eyeOff)
                            : Icon(LucideIcons.eye),
                      ),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      hintStyle: GoogleFonts.poppins(color: Colors.grey),
                      label: Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      filled: true,
                      labelStyle: GoogleFonts.poppins(color: Colors.black),
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 11),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: CustomButton(
                      color: 0xFF4C6FFF,
                      text: 'Login',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(
                            context,
                          ).logIn(email!, password!);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create An Account?',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        ' SignUp',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
