import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/cupertino.dart';
import 'package:hang_out/admin/models/menu_details_value_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CloudinaryService {
  BuildContext context;
  CloudinaryService({required this.context});
  Future<void> uploadImageToCloudinary({required XFile uploadImage}) async {
    print('uploading image...');
    final cloudinary = Cloudinary.unsignedConfig(cloudName: 'di7frbzwv');
    File file = File(uploadImage.path);
    final response = await cloudinary.unsignedUpload(
      file: file.path,
      fileBytes: file.readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
      folder: 'public',
      fileName: uploadImage.name,
      uploadPreset: 'image_upload',
      progressCallback: (count, total) {
        print('Uploading image from file with progress: $count/$total');
      },
    );

    if (response.isSuccessful) {
      context.read<MenuDetailsValueModel>().setImageURLValue(url: response.secureUrl!);
      print('Get your image from with ${response.secureUrl}');
    }
  }
}
