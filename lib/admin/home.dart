import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/theme/theme.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: Text(
          'Dashboard',
          style: GoogleFonts.inter(
            fontSize: ThemeService.HEADING_FONT_SIZE,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

          onPressed: (){},
          backgroundColor: ThemeService.GREEN_COLOR,
      ),
    );
  }
}
