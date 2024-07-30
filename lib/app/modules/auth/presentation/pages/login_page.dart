import 'package:entregas/app/modules/auth/presentation/widgets/contant_login_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentLoginWidget(),
    );
  }
}
