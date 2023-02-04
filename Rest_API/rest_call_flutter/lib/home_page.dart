import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_call_flutter/app_button.dart';
import 'package:rest_call_flutter/base_client.dart';
import 'package:rest_call_flutter/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const FlutterLogo(size: 60),
            //!GET: Lay du lieu
            AppButton(
              operation: 'GET',
              operationColor: Colors.lightGreen,
              description: 'Fetch Users',
              onPressed: () async {
                var response =
                    await BaseClient().get('/users').catchError((err) {});
                if (response == null) return;
                debugPrint('Sucessfull');
                //
                var users = userFromJson(response);
                debugPrint('User count:' + users.length.toString());
              },
            ),
            //!POST: Tao Du Lieu
            AppButton(
              operation: 'POST',
              operationColor: Colors.lightBlue,
              description: 'ADD User',
              onPressed: () async {
                var user = User(
                  name: 'Afzal Ali',
                  qualifications: [
                    Qualification(
                        degree: 'Master', completionData: '01-01-2025'),
                  ],
                );
                var response = await BaseClient()
                    .post('/users', user)
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('successful');
              },
            ),
            //!PUT: Cap Nhat User
            AppButton(
              operation: 'PUT',
              operationColor: Colors.orangeAccent,
              description: 'Edit User',
              onPressed: () async {
                var id = 2;
                var user = User(
                  name: 'Afzal Ali',
                  qualifications: [
                    Qualification(degree: 'Ph.D', completionData: '01-01-2028'),
                  ],
                );
                var response = await BaseClient()
                    .put('/users/$id', user)
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('successful');
              },
            ),
            //!DELETE: Xoa User
            AppButton(
              operation: 'DELETE',
              operationColor: Colors.red,
              description: 'Delete User',
              onPressed: () async {
                var id = 2;
                var response = await BaseClient()
                    .delete('/users/$id')
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('sucessful');
              },
            ),
          ],
        ),
      ),
    );
  }
}
