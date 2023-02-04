// ignore_for_file: sort_child_properties_last
import 'package:call_api/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:call_api/model/user.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3> {
  //user
  List<User> users = [];

  //initState: Khoi tao du lieu Ban Dau
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          //final color = user.gender == 'male' ? Colors.blue : Colors.red;
          //-------------------//
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.phone),
            //tileColor: color,
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  //fetchUsers()
  // Future<void> fetchUsers() async {
  //   print('FetchUsers called');
  //   const url = 'https://randomuser.me/api/?results=100';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //-----------------------------------//
  //   final transformed = results.map((e) {
  //     final name = UserName(
  //       first: e['name']['first'],
  //       last: e['name']['last'],
  //       title: e['name']['title'],
  //     );
  //     return User(
  //       gender: e['gender'],
  //       email: e['email'],
  //       phone: e['phone'],
  //       cell: e['cell'],
  //       nat: e['nat'],
  //       name: name,
  //     );
  //   }).toList();
  //setState: thay doi UI
  //   setState(() {
  //     users = transformed;
  //   });
  //   print('fetchUsers Complted');
  // }
}
