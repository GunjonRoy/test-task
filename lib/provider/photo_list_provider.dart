
import 'package:flutter/cupertino.dart';
import '../model/Helper/photo_load_helper.dart';
import '../model/core/photoDataModel.dart';


class PhotoListProvider with ChangeNotifier{

  PhotoLoadHelper photoLoadHelper=PhotoLoadHelper();


  List<String> loadedPhotos=[];


  loadTwentyPhotos()async{
    //loadedPhotos=List.from(loadedPhotos)..addAll(photoLoadHelper.loadPhotosList()as List<PhotoDataModel>);
    loadedPhotos = [...await photoLoadHelper.loadTenPhotosList()];
    notifyListeners();
    return loadedPhotos;
  }



  get getLoadedPhotoList{
    return loadedPhotos;
  }


}