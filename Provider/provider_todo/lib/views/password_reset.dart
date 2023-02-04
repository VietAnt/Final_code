import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/providers/auth.dart';
import 'package:provider_todo/styles/styles.dart';
import 'package:provider_todo/utils/validate.dart';
import 'package:provider_todo/widgets/styled_flat_button.dart';

class PasswordReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Reset'),
      ),
      body: Center(
        child: Container(
          child: const Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: PasswordResetForm(),
          ),
        ),
      ),
    );
  }
}

class PasswordResetForm extends StatefulWidget {
  const PasswordResetForm({Key? key}) : super(key: key);

  @override
  PasswordResetFormState createState() => PasswordResetFormState();
}

class PasswordResetFormState extends State<PasswordResetForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String message = '';

  Map response = new Map();

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      bool success =
          await Provider.of<AuthProvider>(context).passwordReset(email!);
      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        setState(() {
          message = 'An error occurred during password reset.';
        });
      }
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
            'Request Password Reset',
            textAlign: TextAlign.center,
            style: Styles.h1,
          ),
          const SizedBox(height: 10.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Styles.error,
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
          StyledFlatButton(
            onPressed: submit,
            text: 'Send Password Reset Email',
          ),
        ],
      ),
    );
  }
}
