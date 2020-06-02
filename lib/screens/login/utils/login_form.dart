import 'dart:convert';
import 'dart:io';
import 'package:cheerup/models/user.dart';
import 'package:cheerup/screens/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/home_screen.dart';
import '../../../requests.dart' as requests;

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
  bool _buttonDisabled = false;

  void _changeButtonStatus() {
    setState(() {
      if (_buttonDisabled) {
        _buttonDisabled = false;
      } else {
        _buttonDisabled = true;
      }
    });
  }

  buttonStatus() {
    return _buttonDisabled
        ? Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          )
        : Text(
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          );
  }

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
  _logIn() async {
    var result = await requests.logIn({
      'email': emailController.text,
      'password': passwordController.text,
    });
    _changeButtonStatus();
    if (result.runtimeType == SocketException) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Alert(
            context: context,
            titulo: 'Erro',
            mensagem: 'Houve um erro de conexão com a internet.',
            buttonText: 'Fechar',
          );
        },
      );
    } else {
      print(result.body);
      if (result.statusCode == 200) {
        emailController.clear();
        passwordController.clear();
        var body = jsonDecode(result.body);
        Provider.of<UserData>(context).insert(body);
        _nextScreen();
      } else if (result.statusCode == 403 || result.statusCode == 404) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert(
              context: context,
              titulo: 'Erro de login',
              mensagem: 'O e-mail ou a senha está incorreto.',
              buttonText: 'Fechar',
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert(
              context: context,
              titulo: 'Erro inesperado',
              mensagem: 'Ocorreu um erro inesperado, tente mais tarde.',
              buttonText: 'Fechar',
            );
          },
        );
      }
    }
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
                  child: buttonStatus(),
                  color: Colors.cyan,
                  minWidth: double.infinity,
                  // assim o botão expande até o limite imposto
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async {
                    if (!_buttonDisabled) {
                      if (_formKey.currentState.validate()) {
                        _changeButtonStatus();
                        await _logIn();
                      }
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
