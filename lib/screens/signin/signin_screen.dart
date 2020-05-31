import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // controller: nomeController,
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
                      // controller: sobrenomeController,
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
                      // controller: dataNascimentoController,
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
                      // controller: emailController,
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
                      // controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.cyan,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // _hiddenPassword
                            // ? Icons.visibility
                            Icons.visibility,
                            // : Icons.visibility_off,
                            color: Colors.cyan,
                          ),
                          onPressed: () {
                            // _showPassword();
                          },
                        ),
                        labelText: 'Senha',
                        counterText:
                            '', // para não exibir o contagem de caracteres
                      ),
                      maxLength: 18,
                      // obscureText: _hiddenPassword,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    TextFormField(
                      // controller: passwordAgainController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.cyan,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // _hiddenPassword
                            // ? Icons.visibility
                            Icons.visibility,
                            // : Icons.visibility_off,
                            color: Colors.cyan,
                          ),
                          onPressed: () {
                            // _showPassword();
                          },
                        ),
                        labelText: 'Repita a senha',
                        counterText:
                            '', // para não exibir o contagem de caracteres
                      ),
                      maxLength: 18,
                      // obscureText: _hiddenPassword,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      child: Text(
                        'Criar conta',
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
                        // if (_formKey.currentState.validate()) {
                        //   _logIn();
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
