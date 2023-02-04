import 'package:flutter/cupertino.dart';

//*Tuy_Chinh_Trang
class CustomPageRoute extends PageRouteBuilder {
  Widget child;

  CustomPageRoute({required this.child})
      : super(
          pageBuilder: (context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              child,
          transitionDuration: const Duration(milliseconds: 500),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
