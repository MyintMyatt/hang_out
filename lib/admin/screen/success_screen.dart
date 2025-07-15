

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Image.asset('assets/success.gif',fit: BoxFit.cover,width: 200,height: 200,),
            SizedBox(height: 5,),
            Text('Success',style: GoogleFonts.openSans(fontSize: ThemeService.HEADING_FONT_SIZE,fontWeight: FontWeight.bold),),
            Text('Menu item has been successfully registered.'),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/');
                  context.read<MenuDetailsValueModel>().cancelAll();
                  context.read<PickImageModel>().cancelPickedImage();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.deepOrange)
                ),
                child: Text('Go back home', style: GoogleFonts.openSans(color: ThemeService.WHITE_COLOR),))
          ],
        ),
      )
    );
  }
}
