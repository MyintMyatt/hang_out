
import 'package:flutter/material.dart';
import 'package:hang_out/theme/theme.dart';

Column uploadImageWiget(){
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