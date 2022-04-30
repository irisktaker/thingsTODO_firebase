import 'package:flutter/material.dart';

class LoginBloc {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usController => _userNameController;
  TextEditingController get passController => _passwordController;
}
