import 'package:flutter/material.dart';
import 'package:photo_gallery/model/Helper/photo_load_helper.dart';
import 'package:photo_gallery/provider/photo_list_provider.dart';
import 'package:photo_gallery/provider/photo_view_data_provider.dart';
import 'package:photo_gallery/model/core/photoDataModel.dart';
import 'package:photo_gallery/view/photo_view_page.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  void _setFullScreenImageData(BuildContext context,String imageUrl) {
    Provider.of<PhotoViewDataProvider>(context,listen: false).setImageUrl(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    //final apiService = PhotoListProvider();
    final photoList=Provider.of<PhotoListProvider>(context);
    photoList.loadTwentyPhotos();
    final fullScreenData=Provider.of<PhotoViewDataProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text("Photo Gallery")),
      ),
      // body:
      // FutureBuilder(
      //   future: apiService.loadPhotosList(),
      //   builder: (context, data) {
      //     if (data.hasError) {
      //       print(data.error.toString());
      //       return Center(child: Text("${data.error}"));
      //     } else if (data.hasData) {
      //       var items = data.data as List<PhotoDataModel>;
      //       print(items[0].url.toString());
      //       //print(items);
      //       return
      body:   GridView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: photoList.loadedPhotos.length == null ? 0 : photoList.loadedPhotos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 5,
                mainAxisExtent: MediaQuery.of(context).size.height * .15,
              ),
              itemBuilder: (context, index) {
                final items=photoList.loadedPhotos[index];
                return GestureDetector(
                  onTap: () {
                    print(items.downloadUrl.toString()+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                    fullScreenData.setImageUrl(items.downloadUrl.toString());

                    showDialog(
                      context: context,
                      builder: (context) => FullScreenView(),
                    );

                  },
                  child: Container(
                    //margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(items.downloadUrl.toString()),
                          fit: BoxFit.contain),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                  ),
                );
              },
            )

    );
  }
}
