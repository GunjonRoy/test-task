
import 'package:flutter/cupertino.dart';
import 'package:photo_gallery/model/Helper/photo_load_helper.dart';
import 'package:photo_gallery/model/core/photoDataModel.dart';


class PhotoListProvider with ChangeNotifier{

  PhotoLoadHelper photoLoadHelper=PhotoLoadHelper();

  List<PhotoDataModel> loadedPhotos=[];

  loadTwentyPhotos(){
    loadedPhotos=List.from(loadedPhotos)..addAll(photoLoadHelper.loadPhotosList()as List<PhotoDataModel>);
    notifyListeners();
  }

}