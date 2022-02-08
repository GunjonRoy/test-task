import 'dart:convert';

//import 'package:photo_gallery/core/model/photoDataModel.dart';
import 'package:http/http.dart' as http;
import 'package:photo_gallery/model/core/photoDataModel.dart';

class PhotoApiService {
  Future<String> loadPhotoJson() async {
    final response = await http.get(
      Uri.parse("https://picsum.photos/v2/list"),
      headers: {
        "page": "1",
        "limit": "20",
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  // Future loadPhotosList() async {
  //   String jsonPhotos = await loadPhotoJson();
  //   final jsonResponse = json.decode(jsonPhotos);
  //   PhotosList photosList = PhotosList.fromJson(jsonResponse);
  //   print("photos " + photosList.photos![0].downloadUrl!.toString());
  //   return photosList.photos;
  // }
}
