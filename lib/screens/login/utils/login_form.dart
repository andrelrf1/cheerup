import 'package:flutter/material.dart';
import '../../home/home_screen.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  // variável para validação do form:
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // variáveis que armazenarão os dados do usuário para o logIn:
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // variável para controlar a exibição da senha:
  bool _hiddenPassword = true;

  // Navegação para tela Home:
  void _nextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  // Método que altera a variável de controle da senha:
  void _showPassword() {
    setState(() {
      _hiddenPassword = _hiddenPassword ? false : true;
    });
  }

  // essa função ainda vai ser bem rebuscada
  void _logIn() {
    _nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(7.5),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.cyan,
                    ),
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.cyan,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _hiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.cyan,
                      ),
                      onPressed: () {
                        _showPassword();
                      },
                    ),
                    labelText: 'Senha',
                    counterText: '', // para não exibir o contagem de caracteres
                  ),
                  maxLength: 18,
                  obscureText: _hiddenPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  color: Colors.cyan,
                  minWidth: double.infinity,
                  // assim o botão expande até o limite imposto
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _logIn();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
