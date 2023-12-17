import 'dart:developer';

import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IsarService isar;
  @override
  void initState() {
    super.initState();
    isar = IsarService();
  }

  @override
  Widget build(BuildContext context) {
    // final ali = Player()
    //   ..name = "Ahmad Ali"
    //   ..role = Leon.start();
    // isar.savePlayer(ali);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder<List<Player>>(
        future: isar.getPlayers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final leon = (snapshot.data![index].role as Leon).shotCount;
                log(leon.toString());
                return ListTile(
                  title: Text(snapshot.data![index].name!),
                  subtitle: Text(snapshot.data![index].role!.roleName!),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
