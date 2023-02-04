import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:momo_pay/controllers/db_helper.dart';
import 'package:momo_pay/pages/homepage.dart';

class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  //*CSDL
  DbHelper dbHelper = DbHelper();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      persistentFooterButtons: [
        Container(
          width: 900,
          child: const Text(
            '@momo',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //1*
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/icon.png",
              width: 64.0,
              height: 64.0,
            ),
          ),
          const SizedBox(height: 20),
          //2*
          const Text(
            "What should we Call You?",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          //3*
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Your Name",
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 20),
              maxLength: 12,
              onChanged: (value) {
                name = value;
              },
            ),
          ),
          const SizedBox(height: 20),
          //4*: Button
          SizedBox(
            height: 50,
            child: ElevatedButton(
              //*ASYNC_AWAIT
              onPressed: () async {
                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(
                        label: "OK",
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                      backgroundColor: Colors.white,
                      content: const Text(
                        "Please Enter A Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  );
                } else {
                  DbHelper dbHelper = DbHelper();
                  await dbHelper.addName(name);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Let's Start",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Icon(
                    Icons.arrow_right_alt,
                    size: 24.0,
                  )
                ],
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
