import 'package:flutter/material.dart';
import '../model/Helper/photo_load_helper.dart';
import '../provider/scrollController.dart';
import '../provider/photo_list_provider.dart';
import '../provider/photo_view_data_provider.dart';
import '../model/core/photoDataModel.dart';
import 'package:photo_gallery/view/photo_view_page.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatefulWidget {
  //const PhotoGallery({Key? key}) : super(key: key);

  // void _setFullScreenImageData(BuildContext context, String imageUrl) {
  //   Provider.of<PhotoViewDataProvider>(context, listen: false).setImageUrl(
  //       imageUrl);
  // }


  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  ScrollController scrollController=ScrollController();

  final photoListProvider = PhotoListProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    photoListProvider.loadTwentyPhotos();

    scrollController..addListener((){

      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){

        photoListProvider.loadTwentyPhotos();
        //loadTenPhoto.loadTenPhotosList();
        // PhotoApiService
        // tenImage.fetchTenImage();

      }
    }
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {


    final photoListProvider = PhotoListProvider();
    final photoProvider = Provider.of<PhotoListProvider>(context,listen: false);
    photoProvider.loadTwentyPhotos();

    final fullScreenData = Provider.of<PhotoViewDataProvider>(
        context, listen: false);

    // GalleryScrollController _scrollController=GalleryScrollController();//use for infinity scroll
    // _scrollController.initScrollController();
    //photoListProvider.loadTwentyPhotos();


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: Text("Photo Gallery")),
        ),
        body:
        // FutureBuilder(
        //     future: photoListProvider.loadTwentyPhotos(),//photoListProvider.loadTwentyPhotos(),
        //     //apiService.loadPhotosList(),
        //     builder: (context, data) {
        //       if (data.hasError) {
        //         print(data.error.toString()+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        //         return Center(child: Text("${data.error}"));
        //       } else if (data.hasData) {
        //         var items = data.data as List<String>;
        //
        //         print(items[0].toString());
        //         //print(items);
        //         return
                  GridView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: photoListProvider.loadedPhotos.length == null ? 0 : photoListProvider.loadedPhotos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 5,
                    mainAxisExtent: MediaQuery
                        .of(context)
                        .size
                        .height * .15,
                  ),
                  itemBuilder: (context, index) {
                    //_scrollController.infiniteScrollAction();


                    final item = photoListProvider.loadedPhotos[index];


                    return GestureDetector(
                      onTap: () {
                        print(item.toString() +
                            ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        fullScreenData.setImageUrl(item.toString());

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
                )

        //       } else {
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //     }
        // )

    );
  }
}
