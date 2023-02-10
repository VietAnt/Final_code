import 'package:flutter/material.dart';
import 'package:provider_todo/styles/styles.dart';

class StyledFlatButton extends StatelessWidget {
  //*Bien
  final String text;
  final onPressed;

  const StyledFlatButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // ignore: sort_child_properties_last
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          this.text,
          style: Styles.p.copyWith(
            color: Colors.white,
            height: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
    );
  }
}
