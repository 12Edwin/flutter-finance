import 'package:flutter/material.dart';

class SendCode extends StatefulWidget {
  const SendCode({super.key});

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar código'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo.png', width: 200, height: 200),
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
                                          content: Text(
                                              'Correo inválido, por favor ingrese un correo válido')));
                                } else {
                                  Navigator.pushNamed(context, '/validateCode');
                                }
                              },
                              child: const Text('Enviar código'),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
