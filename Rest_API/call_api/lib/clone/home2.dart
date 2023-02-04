import 'dart:convert';
import 'package:call_api/model/user.dart';
import 'package:call_api/model/user_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class HomeScreen2 extends StatefulWidget {
//   const HomeScreen2({super.key});

//   @override
//   State<HomeScreen2> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen2> {
//   //user
//   List<User> users = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rest API Call'),
//       ),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final user = users[index];
//           //final color = user.gender == 'male' ? Colors.blue : Colors.red;
//           //-------------------//
//           return ListTile(
//             title: Text(user.name.first),
//             subtitle: Text(user.phone),
//             //tileColor: color,
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.refresh),
//         onPressed: fetchUsers,
//       ),
//     );
//   }

//   //fetchUsers()
//   void fetchUsers() async {
//     print('FetchUsers called');
//     const url = 'https://randomuser.me/api/?results=100';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results'] as List<dynamic>;
//     //-----------------------------------//
//     final transformed = results.map((e) {
//       final name = UserName(
//         first: e['name']['first'],
//         last: e['name']['last'],
//         title: e['name']['title'],
//       );
//       return User(
//         gender: e['gender'],
//         email: e['email'],
//         phone: e['phone'],
//         cell: e['cell'],
//         nat: e['nat'],
//         name: name,
//       );
//     }).toList();
//     //setState: thay doi UI
//     setState(() {
//       users = transformed;
//     });
//     print('fetchUsers Complted');
//   }
// }
