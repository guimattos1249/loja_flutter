import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/helpers/validators.dart';
import 'package:loja_virtual_pro/models/user.dart';
import 'package:loja_virtual_pro/models/user_manager.dart';
import 'package:provider/src/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        centerTitle: true,
        title: const Text('Criar Conta'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome Completo',
                  ),
                  validator: (nome) {
                    if (nome!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (nome.trim().split(' ').length <= 1) {
                      return 'Preencha o Nome Completo';
                    }
                    return null;
                  },
                  onSaved: (name) => user.name = name!,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'E-Mail',
                  ),
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (!emailValid(email)) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                  onSaved: (email) => user.email = email!,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                  ),
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (pass.length < 6) {
                      return 'Senha muito curta';
                    }
                    return null;
                  },
                  onSaved: (pass) => user.password = pass!,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirme a Senha',
                  ),
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (pass.length < 6) {
                      return 'Senha muito curta';
                    }
                    return null;
                  },
                  onSaved: (pass) => user.confirmedPassword = pass!,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      backgroundColor: const Color.fromARGB(255, 4, 125, 141),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        if (user.password != user.confirmedPassword) {
                          scaffoldKey.currentState?.showSnackBar(
                            const SnackBar(
                              content: Text('Senhas não coincidem!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        context.read<UserManager>().signUp(
                            user: user,
                            onFail: (e) {
                              scaffoldKey.currentState?.showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Falha ao Cadastrar Usuário: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                            onSuccess: () {
                              //TODO: POP
                            });
                      }
                    },
                    child: const Text('Registrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
