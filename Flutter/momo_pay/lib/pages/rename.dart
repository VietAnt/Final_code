import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:momo_pay/controllers/db_helper.dart';
import 'package:momo_pay/pages/homepage.dart';

class Rename extends StatefulWidget {
  const Rename({super.key});

  @override
  State<Rename> createState() => _RenameState();
}

class _RenameState extends State<Rename> {
  //1* CSDL
  DbHelper dbHelper = DbHelper();

  //2*: name = ?
  String name = "";

  //3*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //4*
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      //5*
      persistentFooterButtons: [
        Container(
          width: 900,
          child: const Text(
            '@momo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      //6* body
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //6.1*
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/icon.png",
              ),
            ),
            const SizedBox(height: 20),
            //6.2*
            const Text(
              "Rename Your Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            //6.3*
            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
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
            //6.4*
            SizedBox(
              height: 50,
              child: ElevatedButton(
                //6.5*
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
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  } else {
                    DbHelper dbHelper = DbHelper();
                    await dbHelper.addName(name);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ),
                    );
                  }
                },
                //6.6*
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Let's Start",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_right_alt,
                      size: 24,
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
      ),
    );
  }
}
