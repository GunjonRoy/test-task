import 'package:flutter/material.dart';
import '../model/Helper/photo_load_helper.dart';
import '../model/core/scrollController.dart';
import '../provider/photo_list_provider.dart';
import '../provider/photo_view_data_provider.dart';
import '../model/core/photoDataModel.dart';
import 'package:photo_gallery/view/photo_view_page.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatelessWidget {
   PhotoGallery({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final photoProvider = Provider.of<PhotoListProvider>(context,listen: false);
    photoProvider.loadTwentyPhotos();

    final fullScreenData = Provider.of<PhotoViewDataProvider>(
        context, listen: false);



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: Text("Photo Gallery")),
        ),
        body:Consumer<PhotoListProvider>(
          builder: (context, photoListData, child) {

            // photoListData.loadTwentyPhotos();

            GalleryScrollController galleryScrollController = GalleryScrollController();
            galleryScrollController.initScrollController(photoListData);


            if (photoListData.loadedPhotos != null && photoListData.loadedPhotos.length > 0) {
              return gridView(context,photoListData,galleryScrollController);
            }

            return Center(child: CircularProgressIndicator());
          },
        ),

    );
  }
  Widget gridView(BuildContext context,PhotoListProvider photoListData,GalleryScrollController galleryScrollController){
    final photoViewDataProvider = Provider.of<PhotoViewDataProvider>(
        context, listen: false);
    //PhotoViewDataProvider photoViewDataProvider=PhotoViewDataProvider();
    final photoDataList = Provider.of<PhotoListProvider>(
        context);

    return GridView.builder(
      controller: galleryScrollController.scrollController,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: photoListData.loadedPhotos.length == null ? 0 : photoListData.loadedPhotos.length,//photoListData.loadedPhotos.length==photoListData.loadedPhotos.length?photoListData.loadedPhotos.length.toInt()+20:0,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 2,
        crossAxisSpacing: 5,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 5,
        mainAxisExtent: 200,

      ),


      itemBuilder: (context, index) {
        //_scrollController.infiniteScrollAction();


        String item = photoListData.loadedPhotos[index];
        print(item+"frrom Grid View");

        return GestureDetector(
          onTap: () {
            print(item.toString() +
                ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            photoViewDataProvider.setImageUrl(item.toString());

            showDialog(
              context: context,
              builder: (context) => FullScreenView(),
            );


          },
          child: Container(
            //margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                  NetworkImage(item.toString()),
                  fit: BoxFit.contain),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(
                      0, 1), // changes position of shadow
                ),
              ],
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
