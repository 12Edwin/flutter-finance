import 'package:flutter/material.dart';

class ValidateCode extends StatefulWidget {
  const ValidateCode({super.key});

  @override
  State<ValidateCode> createState() => _ValidateCodeState();
}

class _ValidateCodeState extends State<ValidateCode> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _codeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar código'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/logo.png', width: 200, height: 200),
                                const SizedBox(height: 16),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    labelText: 'Código',
                                    icon: Icon(Icons.lock),
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: _codeController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Por favor, ingrese el código';
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
                                    onPressed: () {
                                      if (_codeController.text.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Por favor, ingrese el código'),
                                          ),
                                        );
                                      }else{
                                        Navigator.pushNamed(context, '/recovery');
                                      }
                                    },
                                    child: const Text('Validar código',
                                  ),
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
