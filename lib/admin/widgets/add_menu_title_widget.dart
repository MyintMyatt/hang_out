

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hang_out/theme/theme.dart';

Widget menuTitleWidget(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(' Menu Name',style: GoogleFonts.inter(fontSize: ThemeService.SUBTITLE_FONT_SZIDE,color: ThemeService.SECONDARY_BLACK_COLOR,fontWeight: FontWeight.w400),),
      SizedBox(height: 7,),
      TextFormField(
        cursorColor: ThemeService.GREEN_COLOR,
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeService.WHITE_COLOR,
          hintText: 'Enter menu name ...',
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: ThemeService.GREEN_COLOR,width: 1)
          ),
          disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ThemeService.GREEN_COLOR,width: 1)
          ),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ThemeService.PRIMARY_BLACK_COLOR.withValues(alpha: 0.4),width: 1)
          ),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ThemeService.GREEN_COLOR,width: 1)
          )
        ),
        style: GoogleFonts.inter(
            fontSize: 13,
        ),
      )
    ],
  );
}