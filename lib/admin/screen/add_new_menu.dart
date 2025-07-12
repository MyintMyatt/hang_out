import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/admin/widgets/add_menu_title_widget.dart';
import 'package:hang_out/admin/widgets/upload_image.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddNewMenuScreen extends StatelessWidget {
  const AddNewMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image_model = context.watch<PickImageModel>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // clean picked image(set null)
            context.read<PickImageModel>().cancelPickedImage();
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(size: 18, Icons.arrow_back_ios),
        ),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Add menu',
          style: GoogleFonts.inter(
            color: ThemeService.GREEN_COLOR,
            fontSize: ThemeService.HEADING_FONT_SIZE,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              imageContainer(context: context, image_model: image_model),
              SizedBox(height: 20,),
              Text('Menu Details',style: GoogleFonts.openSans(fontSize: ThemeService.HEADING_FONT_SIZE - 2, fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              menuTitleWidget()
            ],
          ),
        ),
      ),
    );
  }
}
