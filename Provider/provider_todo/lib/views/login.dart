import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/providers/auth.dart';
import 'package:provider_todo/styles/styles.dart';
import 'package:provider_todo/utils/validate.dart';
import 'package:provider_todo/widgets/notification_text.dart';
import 'package:provider_todo/widgets/styled_flat_button.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        leading: Container(),
      ),
      body: Center(
        child: Container(
          child: const Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: LogInForm(),
          ),
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      await Provider.of<AuthProvider>(context).login(email!, password!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Log in to the App',
            textAlign: TextAlign.center,
            style: Styles.h1,
          ),
          const SizedBox(height: 10.0),
          Consumer<AuthProvider>(
            builder: (context, provider, child) =>
                provider.notification ??
                const NotificationText(
                  text: '',
                  type: '',
                ),
          ),
          const SizedBox(height: 30.0),
          TextFormField(
              decoration: Styles.input.copyWith(
                hintText: 'Email',
              ),
              validator: (value) {
                email = value?.trim();
                return Validate.validateEmail(value!);
              }),
          const SizedBox(height: 15.0),
          TextFormField(
              obscureText: true,
              decoration: Styles.input.copyWith(
                hintText: 'Password',
              ),
              validator: (value) {
                password = value?.trim();
                return Validate.requiredField(value!, 'Password is required.');
              }),
          const SizedBox(height: 15.0),
          StyledFlatButton(
            onPressed: submit,
            text: ' Sign In',
          ),
          const SizedBox(height: 20.0),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: Styles.p,
                  ),
                  TextSpan(
                    text: 'Register.',
                    style: Styles.p.copyWith(color: Colors.blue[500]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {
                            Navigator.pushNamed(context, '/register'),
                          },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Center(
            child: RichText(
              text: TextSpan(
                  text: 'Forgot Your Password?',
                  style: Styles.p.copyWith(color: Colors.blue[500]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                          Navigator.pushNamed(context, '/password-reset'),
                        }),
            ),
          ),
        ],
      ),
    );
  }
}
