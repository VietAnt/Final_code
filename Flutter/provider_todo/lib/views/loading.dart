import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/providers/auth.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  initAuthProvider(context) async {
    Provider.of<AuthProvider>(context).initAuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    //*initAuth
    initAuthProvider(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: new CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
