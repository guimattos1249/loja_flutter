import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        centerTitle: true,
        title: const Text('Criar Conta'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nome Completo',
                ),
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
                  onPressed: () {},
                  child: const Text('Registrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
