import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/pages/login_page.dart';

class AuthenticationApp implements MicroApp {
  static GlobalKey<NavigatorState>? navigatorGlobal;

  @override
  void init({required GlobalKey<NavigatorState> navigator}) {
    navigatorGlobal = navigator;
  }

  @override
  String get microAppName => 'mfa_authentication';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/login': (context, args) => const LoginPage(),
      '/register': (context, args) => const RegisterPage(),
    };
  }
}
