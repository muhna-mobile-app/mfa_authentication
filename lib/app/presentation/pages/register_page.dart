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
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Observer(builder: (_) {
              return customFormField(
                hintText: 'Nome',
                onChanged: registerFormStore.setName,
                errorText: registerFormStore.validateName,
                keyboardType: TextInputType.name,
              );
            }),
            Observer(builder: (_) {
              return customFormField(
                hintText: 'Email',
                onChanged: registerFormStore.setEmail,
                errorText: registerFormStore.validateEmail,
                keyboardType: TextInputType.emailAddress,
              );
            }),
            Observer(builder: (_) {
              return customFormField(
                hintText: 'Senha',
                obscureText: true,
                onChanged: registerFormStore.setPassword,
                errorText: registerFormStore.validatePassword,
                keyboardType: TextInputType.text,
              );
            }),
            Observer(builder: (_) {
              return customFormField(
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
                    : () async {
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
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login', (route) => false);
                          });
                        }
                      },
                child: authStore.status == AuthStatus.loading
                    ? null
                    : const Text('Cadastrar'))
          ],
        ),
      ),
    );
  }
}
