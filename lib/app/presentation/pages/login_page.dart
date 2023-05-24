import 'dart:developer';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:mfa_authentication/app/presentation/stores/login_form_store.dart';
import 'package:mfa_authentication/app/presentation/widgets/custom_form_field.dart';

import '../stores/auth_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormStore = GetIt.I.get<LoginFormStore>();
  final authStore = GetIt.I.get<AuthStore>();
  @override
  Widget build(BuildContext context) {
    log('Login page: ${authStore.status}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  Observer(
                    builder: (_) => customFormField(
                      labelText: 'Email',
                      hintText: 'exemplo@mail.com',
                      onChanged: loginFormStore.setEmail,
                      errorText: loginFormStore.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  customFormField(
                    labelText: 'Senha',
                    hintText: 'Senha',
                    onChanged: loginFormStore.setPassword,
                    obscureText: true,
                  ),
                  Observer(builder: (_) {
                    return ElevatedButton(
                      onPressed: authStore.status == AuthStatus.loading
                          ? null
                          : () {
                              log(authStore.status.toString());
                              if (loginFormStore.isFormValid) {
                                authStore
                                    .login(
                                  loginFormStore.email,
                                  loginFormStore.password,
                                )
                                    .then((value) {
                                  if (authStore.errorMessage != null) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title:
                                                  const Text('Ocorreu um erro'),
                                              content: const Text(
                                                  'Não foi possível realizar o login'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Fechar'),
                                                )
                                              ],
                                            ));
                                    authStore.errorMessage = null;
                                    return;
                                  }
                                  loginFormStore.clearLoginForm();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                });
                              }
                            },
                      child: const Text('Login'),
                    );
                  }),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/register');
              },
              child: const Text('Não possui uma conta? Registre-se aqui.'),
            ),
          ],
        ),
      ),
    );
  }
}
