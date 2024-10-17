import 'package:finance_app/kernel/widget/text_form_field_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  bool isObscure = true;
  bool isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Registro'),
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 200, height: 200),
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Correo electrónico',
                          hintStyle: TextStyle(color: Colors.blue),
                          labelText: 'Correo electrónico',
                          icon: Icon(Icons.email),
                          labelStyle: TextStyle(color: Colors.blue),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (String? value) {
                          if (value?.contains('@') == false) {
                            return 'Por favor, ingrese su correo electrónico';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFieldPassword(controller: passwordController, labelText: 'Contraseña',
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Por favor, ingrese su contraseña';
                            }
                            return null;
                          },
                      ),
                      TextFieldPassword(controller: passwordConfirmController, labelText: 'Confirmar contraseña',
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Por favor, ingrese su contraseña';
                            }
                            if (value != passwordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                      ),
                      const SizedBox(height: 16),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }

                            }
                          },
                          child: const Text('Registrarse'),
                        ),
                      ),
                    ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
