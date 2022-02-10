import 'package:flutter/cupertino.dart';
import 'photo_list_provider.dart';


class GalleryScrollController with ChangeNotifier{

  ScrollController? scrollController;

  initScrollController(){

    scrollController=ScrollController();
    notifyListeners();
    //return apiService.loadTwentyPhotos();

  }

  infiniteScrollAction(){

    final apiService=PhotoListProvider();
    scrollController!.addListener((){
      if(scrollController!.position.pixels==scrollController!.position.maxScrollExtent){

         apiService.loadTwentyPhotos();
        //loadTenPhoto.loadTenPhotosList();
        // PhotoApiService
        // tenImage.fetchTenImage();
      }
    }
    );
    //return apiService.loadTwentyPhotos();
  }

  void disposeScrollController(){
    scrollController!.dispose();
  }

}