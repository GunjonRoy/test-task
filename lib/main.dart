import 'package:flutter/material.dart';
import 'model/service/photoApiService.dart';
import 'provider/photo_list_provider.dart';
import 'provider/photo_view_data_provider.dart';
import 'view/photo_gallery_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PhotoViewDataProvider()),//PhotoViewDataProvider
        ChangeNotifierProvider.value(value: PhotoListProvider()),//PhotoApiService
        ChangeNotifierProvider.value(value: PhotoApiService()),//GalleryScrollController
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: PhotoGallery(),
      ),
    );
  }
}