import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login ({super.key});

  @override
  State<Login> createState() => _State();
}

class _State extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo.png', width: 200, height: 200),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Correo electrónico',
                            hintStyle: TextStyle(color: Colors.blue),
                            labelText: 'Correo electrónico',
                            icon: Icon(Icons.email),
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Por favor, ingrese su correo electrónico';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            hintStyle: const TextStyle(color: Colors.blue),
                            labelText: 'Contraseña',
                            icon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)
                            ),
                            labelStyle: const TextStyle(color: Colors.blue),
                          ),
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor, ingrese su contraseña';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 48),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            onPressed: () {
                              if (_emailController.text.contains('@') == false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Correo inválido, por favor ingrese un correo válido')
                                  )
                                );
                              }
                              if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Por favor, ingrese su correo electrónico y contraseña'))
                                );
                              } else {
                                // Lógica de inicio de sesión aquí
                              }
                            },
                            child: const Text('Iniciar sesión'),
                          )
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sendCode');
                          },
                          child: const Text('¿Olvidaste tu contraseña?'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
