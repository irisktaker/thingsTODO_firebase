import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/utils/colors.dart';
import '/services/fire_auth.dart';
import '/services/validators.dart';
import '../../widgets/shared/divider_widget.dart';
import '/view/screens/home/home_screen.dart';
import '/view/screens/login/login_screen.dart';
import '../../widgets/shared/social_media_widget.dart';
import '../../widgets/shared/text_form_field_widget.dart';

import 'register_bloc.dart';

final RegisterBloc _bloc = RegisterBloc();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const screenRoute = "register_screen";

  _goToLoginScreen(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Already have an account ",
                style: TextStyle(
                  fontSize: 12,
                  color: ThemeColors.lightGreyColor,
                )),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              ),
              child: const Text("Login",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryColor,
                  )),
            ),
          ],
        ),
      ],
    );
  }

  _registerBox(RegisterBloc _bloc) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: ThemeColors.lightGreyColor,
        ),
      ),
      child: Column(
        children: [
          TextFormFieldWidget(
            hintText: "Username",
            controller: _bloc.usController,
            prefixIcon: const Icon(Icons.person_outline),
            // validator: (value) => Validator.validateName(name: value!),
          ),
          DividerWidget(),
          TextFormFieldWidget(
            hintText: "Email",
            controller: _bloc.emailController,
            prefixIcon: const Icon(Icons.mail),
            // validator: (value) => Validator.validateEmail(email: value!),
          ),
          DividerWidget(),
          TextFormFieldWidget(
            obscureText: true,
            hintText: "Password",
            controller: _bloc.passController,
            prefixIcon: const Icon(Icons.lock_outline),
            // validator: (value) => Validator.validatePassword(password: value!),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeColors.whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          width: size.width,
          height: size.height,
          child: Form(
            key: _bloc.formKey,
            child: Column(
              children: [
                const Spacer(flex: 5),
                Image.asset(
                  "assets/logo/main_logo.png",
                  width: 150,
                  height: 150,
                ),
                const Spacer(flex: 2),
                _registerBox(_bloc),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // if (_bloc.formKey.currentState!.validate()) {
                    //   User? user = await FireAuth.registerUsingEmailPassword(
                    //     name: _bloc.usController.text,
                    //     email: _bloc.emailController.text,
                    //     password: _bloc.passController.text,
                    //   );

                    //   if (user != null) {
                    //     Navigator.pushReplacementNamed(
                    //       context,
                    //       HomeScreen.screenRoute,
                    //     );
                    //   }
                    // }
                  },
                  child: Text("Register".toUpperCase()),
                ),
                _goToLoginScreen(context),
                const Spacer(flex: 2),
                const SocialMediaWidget(),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
