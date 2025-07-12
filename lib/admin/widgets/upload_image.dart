
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

//image container
GestureDetector imageContainer({required BuildContext context, required dynamic image_model}){
  return GestureDetector(
    onTap: () async {
      XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null)
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
      child:
      image_model.image == null
          ? emptyImageWiget()
          : pickedImageWidget(context: context,image_model: image_model),
    ),
  );
}


// not pick image yet
Column emptyImageWiget(){
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              width: 80,
              height: 80,
              'assets/photo.gif',
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              child: Text(
                'Upload',
                style: TextStyle(
                    color: ThemeService.SECONDARY_BLACK_COLOR,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
      // TextButton(onPressed: () {},
      //     child: Text('Upload', style: TextStyle(
      //         color: ThemeService.SECONDARY_BLACK_COLOR),))
    ],
  );
}


//after pick image
Padding pickedImageWidget({required BuildContext context, required dynamic image_model}){
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: FileImage(
                File(image_model.image!.path),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 70,
          child: ElevatedButton(
            onPressed: () async {
              XFile? pickedImage = await ImagePicker()
                  .pickImage(
                source: ImageSource.gallery,
              );
              if (pickedImage != null) {
                context.read<PickImageModel>().setPickedImage(pickedImage!);
              }
              // print(pickedImage!.path);
            },
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(200, 40),
              ),
              backgroundColor: WidgetStatePropertyAll(
                ThemeService.WHITE_COLOR.withValues(
                  alpha: .3,
                ),
              ),
            ),
            child: Text(
              'Upload',
              style: TextStyle(
                color:
                ThemeService.SECONDARY_BLACK_COLOR,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


