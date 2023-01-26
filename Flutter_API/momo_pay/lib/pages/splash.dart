import 'package:flutter/material.dart';
import 'package:momo_pay/controllers/db_helper.dart';
import 'package:momo_pay/pages/add_name.dart';
import 'package:momo_pay/pages/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //1.CSDL
  DbHelper dbHelper = DbHelper();

  //3.initState: Khoi Tao State
  @override
  void initState() {
    super.initState();
    getName();
  }

  //2.getName()
  Future getName() async {
    String? name = await dbHelper.getName();
    if (name != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AddName(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            "assets/icon.png",
            width: 64.0,
            height: 64.0,
          ),
        ),
      ),
    );
  }
}
