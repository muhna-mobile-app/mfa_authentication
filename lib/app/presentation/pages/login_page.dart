import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:mfa_authentication/app/presentation/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = GetIt.I.get<LoginController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    String authToken;
                    loginController
                        .logInUser(
                      emailController.text,
                      passwordController.text,
                    )
                        .then((value) {
                      authToken = value!;
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text('Logged in successfully!'),
                                content: Text('Auth Token: $authToken'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Dismiss'),
                                  )
                                ],
                              ));
                    });
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Ocorreu um erro'),
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
                  }
                  // Navigator.of(context).pushNamed('/home');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
