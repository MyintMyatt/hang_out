
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:hang_out/theme/theme.dart';
import 'package:provider/provider.dart';

Widget descWidget({required BuildContext context}){
  final menu_details_value_model = context.read<MenuDetailsValueModel>();
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Description *',
        style: GoogleFonts.inter(
          fontSize: ThemeService.SUBTITLE_FONT_SZIDE,
          color: ThemeService.SECONDARY_BLACK_COLOR,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 5),
      TextFormField(
        onChanged: (value){
          menu_details_value_model.setDescValue(desc: value);
        },
        cursorColor: ThemeService.GREEN_COLOR,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'e.g ingredients or description',
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
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