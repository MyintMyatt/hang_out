import 'package:flutter/material.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/admin/screen/add_new_menu.dart';
import 'package:hang_out/admin/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PickImageModel()),
      ],
      child: const HangOut(),
    ),
  );
}

class HangOut extends StatelessWidget {
  const HangOut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AdminHomeScreen(),
        '/add_new_menu': (context) => AddNewMenuScreen(),
      },
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF03665e))),
      // home: AdminHomeScreen(),
    );
  }
}
