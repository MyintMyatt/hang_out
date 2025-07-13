import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/category_list.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/admin/widgets/add_menu_title_widget.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:provider/provider.dart';

// category dropdown and price text field
Widget categoryDropDownAndPrice(BuildContext context) {
  //instantiated from provider class
  final categoryModel = context.watch<CategoryList>(); // category list
  final dropdownValueModelForModify =
      context.read<MenuDetailsValueModel>(); // selected drop down value for modify value in class
  final dropdownValueModelForRebuildUI = context.watch<MenuDetailsValueModel>(); // selected drop down value for rebuild ui

  List<String> categoryList =
      categoryModel.categoryList.cast<String>().toList();

  WidgetsBinding.instance.addPostFrameCallback((_){
    if (dropdownValueModelForModify.categoryValue == null) {
      dropdownValueModelForModify.setCategoryValue(
        selectedValue: categoryList.first,
      );
    }
  });
  String ddValue = dropdownValueModelForRebuildUI.categoryValue ?? categoryList.first;

  Size screenWidth = MediaQuery.of(context).size;
  return Row(
    // crossAxisAlignment: CrossAxisAlignment.,
    spacing: 10,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: screenWidth.width * 0.35,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 10,
          children: [
            titleWidget(titleName: ' Category *'),
            SizedBox(height: 5,),
            DropdownButtonFormField(
              elevation: 2,
              padding: EdgeInsets.all(0),
              dropdownColor: ThemeService.WHITE_COLOR,
              isExpanded: true,
              value: ddValue,
              items:
                  categoryList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
              onChanged: (String? value) {
                dropdownValueModelForModify.setCategoryValue(
                  selectedValue: value!,
                );
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: borderStyle(),
                enabledBorder: borderStyle(),
                focusedBorder: borderStyle()
              ),
              style: GoogleFonts.inter(fontSize: 13,color: ThemeService.SECONDARY_BLACK_COLOR),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget(titleName: ' Price (Ks) *'),
            SizedBox(height: 5,),
            TextFormField(
              onChanged: (value){
                dropdownValueModelForRebuildUI.setPriceValue(price: double.parse(value));
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              cursorColor: ThemeService.GREEN_COLOR,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'e.g 12000',
                border: borderStyle(),
                enabledBorder: borderStyle(),
                focusedBorder: borderStyle(focus: true),
              ),
              style: GoogleFonts.inter(fontSize: 13),
            ),
          ],
        ),
      ),
      Expanded(child:
        menuTitleOrStockWidget(context: context, isTitle: false),)
    ],
  );
}

titleWidget({required String titleName}){
  return Text(titleName,
    style: GoogleFonts.inter(
      fontSize: ThemeService.SUBTITLE_FONT_SZIDE,
      color: ThemeService.SECONDARY_BLACK_COLOR,
      fontWeight: FontWeight.w400,
    ),
  );
}

borderStyle({bool focus = false}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color:focus ?ThemeService.PRIMARY_BLACK_COLOR.withValues(alpha: 0.4): ThemeService.GREEN_COLOR,
      width: 1,
    ),
  );
}
