import 'package:flutter/material.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {

  final TextEditingController pass_1_controller = TextEditingController();
  final TextEditingController pass_2_controller = TextEditingController();
  bool isObscure_1 = true;
  bool isObscure_2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/logo.png', width: 200, height: 200),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Nueva contraseña',
                                  icon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure_1 = !isObscure_1;
                                      });
                                    },
                                    icon: Icon(isObscure_1 ? Icons.visibility : Icons.visibility_off),
                                  ),
                                  labelStyle: const TextStyle(color: Colors.blue),
                                ),
                                controller: pass_1_controller,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isObscure_1,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, ingrese su nueva contraseña';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Confirmar contraseña',
                                  icon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure_2 = !isObscure_2;
                                      });
                                    },
                                    icon: Icon(isObscure_2 ? Icons.visibility : Icons.visibility_off),
                                  ),
                                  labelStyle: const TextStyle(color: Colors.blue),
                                ),
                                controller: pass_2_controller,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isObscure_2,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, confirme su nueva contraseña';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
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
                                    if (pass_1_controller.text.isEmpty || pass_2_controller.text.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Por favor, ingrese su nueva contraseña')));
                                    } else if (pass_1_controller.text != pass_2_controller.text) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Las contraseñas no coinciden')));
                                    } else {
                                      Navigator.pushNamed(context, '/login');
                                    }
                                  },
                                  child: const Text('Cambiar contraseña'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                );
              }
          ),
      ),
    );
  }
}
