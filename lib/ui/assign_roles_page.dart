import 'dart:math';

import 'package:flutter/material.dart';

class AssignRolesScreen extends StatefulWidget {
  @override
  _AssignRolesScreenState createState() => _AssignRolesScreenState();
}

class _AssignRolesScreenState extends State<AssignRolesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  List<String> _players = [];
  List<String> _roles = [];

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _assignRoles() {
    if (_formKey.currentState!.validate()) {
      final int numberOfPlayers = int.parse(_numberController.text);
      _players.clear();
      _roles.clear();

      for (int i = 0; i < numberOfPlayers; i++) {
        _players.add(_nameController.text);
        _roles.add(_generateRandomRole());
      }

      // TODO: Implement logic to assign roles to players

      _nameController.clear();
      _numberController.clear();
    }
  }

  String _generateRandomRole() {
    final roles = ['Mafia', 'Detective', 'Doctor', 'Citizen'];
    final random = Random();
    return roles[random.nextInt(roles.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Roles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Player Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Players',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _assignRoles,
                child: Text('Assign Roles'),
              ),
              SizedBox(height: 16.0),
              Text('Players: $_players'),
              SizedBox(height: 16.0),
              Text('Roles: $_roles'),
            ],
          ),
        ),
      ),
    );
  }
}
