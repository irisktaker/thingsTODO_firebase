import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/utils/colors.dart';
import '/services/fire_auth.dart';
import '/services/validators.dart';
import '../../widgets/shared/divider_widget.dart';
import '/view/screens/home/home_screen.dart';
import '../../widgets/shared/social_media_widget.dart';
import '../../widgets/shared/text_form_field_widget.dart';
import '/view/screens/register/register_screen.dart';

import 'login_bloc.dart';

final LoginBloc _bloc = LoginBloc();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  _goToRegisterScreen(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Don't have an account ",
                style: TextStyle(
                  fontSize: 12,
                  color: ThemeColors.lightGreyColor,
                )),
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                RegisterScreen.screenRoute,
              ),
              child: const Text("Register",
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

  _loginBox(LoginBloc _bloc) {
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
                _loginBox(_bloc),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // if (_bloc.formKey.currentState!.validate()) {
                    //   User? user = await FireAuth.signInUsingEmailPassword(
                    //       email: _bloc.usController.text,
                    //       password: _bloc.passController.text,
                    //       context: context);

                    //   if (user != null) {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.screenRoute,
                    );
                    //   }
                    // }
                  },
                  child: Text("Login".toUpperCase()),
                ),
                _goToRegisterScreen(context),
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
