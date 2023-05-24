import 'dart:developer';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:mfa_authentication/app/presentation/stores/auth_store.dart';
import 'package:mfa_authentication/app/presentation/stores/register_form_store.dart';
import 'package:mfa_authentication/app/presentation/widgets/custom_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerFormStore = GetIt.I.get<RegisterFormStore>();
    final authStore = GetIt.I.get<AuthStore>();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                Observer(builder: (_) {
                  return customFormField(
                    labelText: 'Nome',
                    hintText: 'José Silva',
                    onChanged: registerFormStore.setName,
                    errorText: registerFormStore.validateName,
                    keyboardType: TextInputType.name,
                  );
                }),
                Observer(builder: (_) {
                  return customFormField(
                    labelText: 'Email',
                    hintText: 'exemplo@mail.com',
                    onChanged: registerFormStore.setEmail,
                    errorText: registerFormStore.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  );
                }),
                Observer(builder: (_) {
                  return customFormField(
                    labelText: 'Senha',
                    hintText: 'Senha',
                    obscureText: true,
                    onChanged: registerFormStore.setPassword,
                    errorText: registerFormStore.validatePassword,
                    keyboardType: TextInputType.text,
                  );
                }),
                Observer(builder: (_) {
                  return customFormField(
                    labelText: 'Confirmar senha',
                    hintText: 'Confirmar senha',
                    obscureText: true,
                    onChanged: registerFormStore.setConfirmPassword,
                    errorText: registerFormStore.validateConfirmPassword,
                    keyboardType: TextInputType.text,
                  );
                }),
                ElevatedButton(
                    onPressed: authStore.status == AuthStatus.loading
                        ? null
                        : () {
                            log(authStore.status.toString());
                            formKey.currentState!.save();
                            if (registerFormStore.isFormValid) {
                              authStore
                                  .register(
                                registerFormStore.name,
                                registerFormStore.email,
                                registerFormStore.password,
                              )
                                  .then((value) {
                                if (authStore.errorMessage != null) {
                                  return showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Ocorreu um erro'),
                                      content: Text(
                                        authStore.errorMessage!,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Fechar'),
                                        )
                                      ],
                                    ),
                                  );
                                }
                                registerFormStore.clearRegisterForm();
                                Navigator.of(context)
                                    .pushReplacementNamed('/login');
                              });
                            }
                          },
                    child: authStore.status == AuthStatus.loading
                        ? null
                        : const Text('Cadastrar')),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: const Text('Já possuo uma conta.'),
          ),
        ],
      ),
    );
  }
}
