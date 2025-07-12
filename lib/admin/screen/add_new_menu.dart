import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
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
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if(pickedImage != null)
                    context.read<PickImageModel>().setPickedImage(pickedImage!);
                  // print(pickedImage!.path);
                },
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: ThemeService.WHITE_COLOR,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: ThemeService.LIGHT_GREEN_COLOR),
                    // border: Con
                  ),
                  child:image_model.image == null ? uploadImageWiget() : Image.file(File(image_model.image!.path)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
