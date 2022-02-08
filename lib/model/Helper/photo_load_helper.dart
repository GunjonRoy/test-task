
import 'dart:convert';

import 'package:photo_gallery/model/core/photoDataModel.dart';
import 'package:photo_gallery/model/service/photoApiService.dart';

class PhotoLoadHelper{

  PhotoApiService service= PhotoApiService();

  loadPhotosList() async {

    String jsonPhotos = await service.loadPhotoJson();
    final jsonResponse = json.decode(jsonPhotos);
    PhotosList photosList = PhotosList.fromJson(jsonResponse);
    print("photos " + photosList.photos![0].downloadUrl!.toString());

    return photosList.photos;
  }
}