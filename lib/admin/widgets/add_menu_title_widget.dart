import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:provider/provider.dart';

Widget menuTitleOrStockWidget({required BuildContext context,bool isTitle = true}) {
  TextEditingController menuTitleController = TextEditingController();
  TextEditingController menuStockController = TextEditingController();
  final menu_detial_value_model = context.read<MenuDetailsValueModel>();
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        isTitle ? ' Menu Name *' : 'Initial Stocks *',
        style: GoogleFonts.inter(
          fontSize: ThemeService.SUBTITLE_FONT_SZIDE,
          color: ThemeService.SECONDARY_BLACK_COLOR,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 5),
      TextFormField(
        //controller:  isTitle ?menuTitleController : menuStockController,
        onChanged: (String value){
            if(isTitle){
              menu_detial_value_model.setMenuTitle(value: value);
            }else{
              print('value => $value');
              if(value.isEmpty){
                  menu_detial_value_model.setStockValue(stock: null);
              }else{
              menu_detial_value_model.setStockValue(stock: int.parse(value));
            }}
        },
        keyboardType: isTitle ? TextInputType.text : TextInputType.numberWithOptions(decimal: false),
        cursorColor: ThemeService.GREEN_COLOR,
        decoration: InputDecoration(
          hintText: isTitle ? 'Enter menu name..' :  'e.g. 30',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: borderStyle(),
          enabledBorder: borderStyle(),
          focusedBorder: borderStyle(focus: true),
        ),
        style: GoogleFonts.inter(fontSize: 13),
      ),
    ],
  );
}

borderStyle({bool focus = false}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color:
          focus
              ? ThemeService.PRIMARY_BLACK_COLOR.withValues(alpha: 0.4)
              : ThemeService.GREEN_COLOR,
      width: 1,
    ),
  );
}
