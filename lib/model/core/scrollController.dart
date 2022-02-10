import 'package:flutter/cupertino.dart';
import '../../provider/photo_list_provider.dart';


class GalleryScrollController{

  ScrollController scrollController=ScrollController();

  initScrollController(PhotoListProvider photoListData){
    //scrollController=ScrollController();
    // final photoListData=PhotoListProvider();
    // photoListData.loadTwentyPhotos();

    scrollController.addListener((){
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){

        photoListData.loadTwentyPhotos();
        //loadTenPhoto.loadTenPhotosList();
        // PhotoApiService
        // tenImage.fetchTenImage();
      }
    }
    );
    //notifyListeners();
    //return apiService.loadTwentyPhotos();
  }

  // infiniteScrollAction(){
  //
  //   final photoListData=PhotoListProvider();
  //   scrollController!.addListener(()async{
  //     if(scrollController!.position.pixels==scrollController!.position.maxScrollExtent){
  //
  //       await photoListData.loadTwentyPhotos();
  //       //loadTenPhoto.loadTenPhotosList();
  //       // PhotoApiService
  //       // tenImage.fetchTenImage();
  //     }
  //   }
  //   );
  //   //return apiService.loadTwentyPhotos();
  // }

  void disposeScrollController(){
    scrollController.dispose();
  }

}