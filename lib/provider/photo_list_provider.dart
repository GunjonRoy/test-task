
import 'package:flutter/cupertino.dart';
import '../model/Helper/photo_load_helper.dart';
import '../model/core/photoDataModel.dart';


class PhotoListProvider with ChangeNotifier{

  PhotoLoadHelper photoLoadHelper=PhotoLoadHelper();
  List<String> loadedPhotos=[];


  loadTwentyPhotos()async{
    //loadedPhotos=List.from(loadedPhotos)..addAll(photoLoadHelper.loadPhotosList()as List<PhotoDataModel>);
    loadedPhotos = [...await photoLoadHelper.loadTenPhotosList()];
    for(int i=0;i<loadedPhotos.length;i++){
      print("PhotoListProvider"+i.toString());
      print(loadedPhotos[i].toString());
    }
    notifyListeners();
    //return loadedPhotos;
  }



  get getLoadedPhotoListLength{
    return loadedPhotos;
  }


}