import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/admin/models/menu_model.dart';
import 'package:hang_out/admin/models/pick_image_model.dart';
import 'package:hang_out/admin/services/menu_provider.dart';
import 'package:hang_out/admin/services/upload_image_to_cloudinary.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:provider/provider.dart';

Widget submitButton({required BuildContext context}) {
  final menu_details_value_model = context.watch<MenuDetailsValueModel>();
  final menuProvider = context.read<MenuProvider>();
  final pickedImageModel = context.watch<PickImageModel>();
  return SizedBox(
    child: ElevatedButton(
      onPressed: () async {
        //show loading
        context.read<MenuDetailsValueModel>().setLoading(true);

        if (pickedImageModel.image == null ||
            menu_details_value_model.menuTitle == null ||
            menu_details_value_model.menuTitle!.isEmpty ||
            menu_details_value_model.categoryValue == null ||
            menu_details_value_model.categoryValue!.isEmpty ||
            menu_details_value_model.imageURL == null ||
            menu_details_value_model.imageURL!.isEmpty ||
            menu_details_value_model.stock == null ||
            menu_details_value_model.stock!.isNaN ||
            menu_details_value_model.price == null ||
            menu_details_value_model.price!.isNaN ||
            menu_details_value_model.desc == null ||
            menu_details_value_model.desc!.isEmpty) {
          //  remove loading
          context.read<MenuDetailsValueModel>().setLoading(false);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.fixed,
              showCloseIcon: true,
              content: Text('Please enter require fields'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          //upload image to cloudinary
          CloudinaryService cloudinaryService = CloudinaryService(
            context: context,
          );
          print('uploading...');
          await cloudinaryService.uploadImageToCloudinary(
            uploadImage: pickedImageModel.image!,
          );

          Menu menu = Menu(
            menuName: menu_details_value_model.menuTitle!,
            menuDetails: MenuDetails(
              category: menu_details_value_model.categoryValue!,
              imageURL: menu_details_value_model.imageURL!,
              stock: menu_details_value_model.stock!,
              price: menu_details_value_model.price!,
              desc: menu_details_value_model.desc!,
            ),
          );

          print(menu.toMap());

          //add menu to firebase
         await menuProvider.addNewMenu(menu);

          // remove loading
          context.read<MenuDetailsValueModel>().setLoading(false);
        }
        // if(menu_details_value_model.menuTitle.isEmpt)
        // menuProvider.addNewMenu(menu);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ThemeService.GREEN_COLOR),
        fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Submit',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: ThemeService.WHITE_COLOR,
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/upload.gif'),
          ),
        ],
      ),
    ),
  );
}
