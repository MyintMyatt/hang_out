import 'package:flutter/material.dart';
import 'package:hang_out/admin/home.dart';
import 'package:hang_out/theme/theme.dart';

void main(){
    runApp(const HangOut());
}

class HangOut extends StatelessWidget {
  const HangOut ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF03665e))),
          home: AdminHomeScreen(),
    );
  }
}
