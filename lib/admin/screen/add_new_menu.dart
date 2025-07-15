import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/admin/widgets/add_menu_category_drop_down_and_price.dart';
import 'package:hang_out/admin/widgets/add_menu_desc_or_ingredient_widget.dart';
import 'package:hang_out/admin/widgets/add_menu_submit_button.dart';
import 'package:hang_out/admin/widgets/add_menu_title_widget.dart';
import 'package:hang_out/admin/widgets/upload_image.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddNewMenuScreen extends StatelessWidget {
  const AddNewMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image_model = context.watch<PickImageModel>();
    bool loading = context.watch<MenuDetailsValueModel>().isLoading;
    return  Stack(
      children: [Scaffold(
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
                SizedBox(height: 15,),
                Text('Menu Details',style: GoogleFonts.openSans(fontSize: ThemeService.HEADING_FONT_SIZE - 2, fontWeight: FontWeight.w500),),
                SizedBox(height: 15,),
                menuTitleOrStockWidget(context: context),
                SizedBox(height: 15,),
                categoryDropDownAndPrice(context),
                SizedBox(height: 15,),
                descWidget(context: context),
                SizedBox(height: 15,),
                submitButton(context: context)
              ],
            ),
          ),
        ),
      ),
        // Loading Overlay
        if (loading)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(0.1),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(20)
                    ),
                      child:  Image.asset('assets/loader.gif', width: 100),)

    //Lottie.network('https://lottie.host/ff3cc6ac-b1c7-4efa-9d5d-44c7b0068ae0/ESRZDOiTbM.json',width: 100))
                ),
              ),
            ),
          ),
      ]
    );
  }
}
