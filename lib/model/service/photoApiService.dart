
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PhotoApiService with ChangeNotifier{

  int page=1;
  int limit=0;
  void setPageAndLimit(){
    this.page=1;
    this.limit=this.limit+20;
    notifyListeners();
  }

  Future<String> loadPhotoJson() async {

    setPageAndLimit();

    final response = await http.get(
      Uri.parse("https://picsum.photos/v2/list?page="+page.toString()+"&limit="+limit.toString()),//"https://picsum.photos/v2/list"),
      // headers: {
      //   "page": "1",
      //   "limit": "20",
      // },
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
