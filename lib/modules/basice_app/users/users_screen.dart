import 'package:flutter/material.dart';
import '../../../models/user/user_model.dart';

class UsersScreen extends StatefulWidget {

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.phone,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
}
