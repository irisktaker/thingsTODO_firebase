import 'package:flutter/material.dart';

class RegisterBloc {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usController => _userNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passController => _passwordController;
}
