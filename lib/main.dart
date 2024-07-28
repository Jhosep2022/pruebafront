import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebafront/services/UserService.dart';
import 'package:pruebafront/view/screen/UserScreen.dart';
import 'package:pruebafront/view/screen/UserFormScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserService>(create: (_) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const UserScreen(),
          '/addUser': (context) => const UserFormScreen(),
        },
      ),
    );
  }
}
