import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hang_out/admin/models/category_list.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/admin/screen/add_new_menu.dart';
import 'package:hang_out/admin/screen/home.dart';
import 'package:hang_out/admin/screen/success_screen.dart';
import 'package:hang_out/admin/services/menu_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  print('✅ Firebase Initialized');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PickImageModel()),
        ChangeNotifierProvider(create: (context) => CategoryList()),
        ChangeNotifierProvider(create: (context)=> MenuDetailsValueModel()),
        ChangeNotifierProvider(create: (context) => MenuProvider())
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
        '/success':(context) => SuccessScreen()
      },
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF03665e))),
      // home: AdminHomeScreen(),
    );
  }
}
