import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perami/login/login.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      _loginBloc.dispatch(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (
          BuildContext context,
          LoginState state,
        ) {
          return Form(
              child: Padding(
            padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset('assets/perami.png', height: 200)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                  autovalidate: true,
                  autocorrect: false,
                  controller: _usernameController,
                ),
                SizedBox(height: 25),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                  controller: _passwordController,
                  autovalidate: true,
                  autocorrect: false,
                  obscureText: true,
                ),
                SizedBox(height: 25),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.green,
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () {
                                _onLoginButtonPressed();
                              },
                              child: state is LoginLoading
                                  ? new CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.white))
                                  : Text("Login",
                                      textAlign: TextAlign.center,
                                      style: style.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                            ))
                      ],
                    )),
              ],
            ),
          ));
        },
      ),
    );
  }
}
