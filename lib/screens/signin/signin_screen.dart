import 'dart:io';
import 'package:cheerup/screens/login/login_screen.dart';
import 'package:cheerup/screens/utils/alert.dart';
import 'package:flutter/material.dart';
import '../../requests.dart' as requests;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  bool _hiddenPassword = true;
  bool _hiddenPassword2 = true;
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
            'Criar conta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          );
  }

  void _showPassword(int labelNumber) {
    setState(() {
      if (labelNumber == 1) {
        _hiddenPassword = _hiddenPassword ? false : true;
      } else {
        _hiddenPassword2 = _hiddenPassword2 ? false : true;
      }
    });
  }

  _signin() async {
    var result = await requests.signIn({
      'email': emailController.text,
      'first_name': nameController.text,
      'last_name': lastNameController.text,
      'birth_date': dateOfBirthController.text,
      'password': passwordController.text
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
      if (result.statusCode == 200) {
        emailController.clear();
        nameController.clear();
        lastNameController.clear();
        dateOfBirthController.clear();
        passwordController.clear();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert(
              context: context,
              titulo: 'Sucesso',
              mensagem: 'Sua conta foi criada!',
              buttonText: 'Ok',
              function: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
            );
          },
        );
      } else {
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Center(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: Colors.grey,
                          size: 200,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.cyan,
                            ),
                            labelText: 'Nome',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.cyan,
                            ),
                            labelText: 'Sobrenome',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        TextFormField(
                          controller: dateOfBirthController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Colors.cyan,
                            ),
                            labelText: 'Data de nascimento',
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
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
                                _showPassword(1);
                              },
                            ),
                            labelText: 'Senha',
                            counterText:
                                '', // para não exibir o contagem de caracteres
                          ),
                          maxLength: 18,
                          obscureText: _hiddenPassword,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        TextFormField(
                          controller: passwordAgainController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.cyan,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _hiddenPassword2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.cyan,
                              ),
                              onPressed: () {
                                _showPassword(2);
                              },
                            ),
                            labelText: 'Repita a senha',
                            counterText:
                                '', // para não exibir o contagem de caracteres
                          ),
                          maxLength: 18,
                          obscureText: _hiddenPassword2,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 50,
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
                                if (passwordController.text ==
                                    passwordAgainController.text) {
                                  _changeButtonStatus();
                                  await _signin();
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Alert(
                                          context: context,
                                          titulo: 'Erro',
                                          mensagem: 'As senhas não conferem!',
                                          buttonText: 'Fechar',
                                        );
                                      });
                                }
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
