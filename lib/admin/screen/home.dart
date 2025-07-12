import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:lottie/lottie.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ThemeService.WHITE_COLOR,
        // elevation: 3,
        leading: IconButton(onPressed: () {}, icon: Icon(size: 18, Icons.menu)),
        titleSpacing: 0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.inter(
            color: ThemeService.GREEN_COLOR,
            fontSize: ThemeService.HEADING_FONT_SIZE,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Lottie.network(
          'https://lottie.host/8c3d4d64-cdd5-4d55-8f00-01ab4e0c5aff/v1tYfxiw5x.json',
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/add_new_menu');
        },
        backgroundColor: ThemeService.SECONDARY_BLACK_COLOR,
      ),
    );
  }
}
