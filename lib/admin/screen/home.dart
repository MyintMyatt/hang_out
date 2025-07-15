import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/services/menu_provider.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = context.watch<MenuProvider>();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ThemeService.WHITE_COLOR,
        // elevation: 3,
        leading: IconButton(
          onPressed: () async {
            // await MenuProvider().test();
            await context.read<MenuProvider>().test();
          },
          icon: Icon(size: 18, Icons.menu),
        ),
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

      body: GridView.builder(
          padding: EdgeInsets.all(10),
        itemCount: menus.menus.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),
          itemBuilder: (context, index){
            final menu = menus.menus[index];
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(menu.menuDetails.imageURL),fit: BoxFit.cover,filterQuality: FilterQuality.high)
                  ),
                )
              ],
            );
          }),

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
