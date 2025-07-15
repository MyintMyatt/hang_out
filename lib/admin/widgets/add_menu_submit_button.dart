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

  return SizedBox(
    child: ElevatedButton(
      onPressed: () async {

        final menuDetailsValueModel = context.read<MenuDetailsValueModel>();
        final menuProvider = context.read<MenuProvider>();
        final pickedImageModel = context.read<PickImageModel>();

        //show loading
        menuDetailsValueModel.setLoading(true);

        if (pickedImageModel.image == null ||
            menuDetailsValueModel.menuTitle == null ||
            menuDetailsValueModel.menuTitle!.isEmpty ||
            menuDetailsValueModel.categoryValue == null ||
            menuDetailsValueModel.categoryValue!.isEmpty ||
            menuDetailsValueModel.imageURL == null ||
            // menuDetailsValueModel.imageURL!.isEmpty ||
            menuDetailsValueModel.stock == null ||
            menuDetailsValueModel.stock!.isNaN ||
            menuDetailsValueModel.price == null ||
            menuDetailsValueModel.price!.isNaN ||
            menuDetailsValueModel.desc == null ||
            menuDetailsValueModel.desc!.isEmpty) {
          //  remove loading
          menuDetailsValueModel.setLoading(false);

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
            menuName: menuDetailsValueModel.menuTitle!,
            menuDetails: MenuDetails(
              category: menuDetailsValueModel.categoryValue!,
              imageURL: menuDetailsValueModel.imageURL!,
              stock: menuDetailsValueModel.stock!,
              price: menuDetailsValueModel.price!,
              desc: menuDetailsValueModel.desc!,
            ),
          );

          print(menu.toMap());

          //add menu to firebase
         await menuProvider.addNewMenu(menu);

          print('✅ setLoading(false) called');
          // remove loading
          context.read<MenuDetailsValueModel>().setLoading(false);

          await Future.delayed(Duration(milliseconds: 100));
          print('✅ Navigating to success screen...');
          //Navigate to success screen
          Navigator.pushNamed(context, '/success');
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
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
