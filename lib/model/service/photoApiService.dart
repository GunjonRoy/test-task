
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PhotoApiService with ChangeNotifier{

  int page=1;
  int limit=0;
  void setPageAndLimit(){
    this.page=1;
    this.limit=this.limit+8;
    notifyListeners();
  }

  Future<String> loadPhotoJson() async {

    setPageAndLimit();

    final response = await http.get(

      Uri.parse("https://picsum.photos/v2/list?page="+page.toString()+"&limit="+limit.toString()),//"https://picsum.photos/v2/list"),

    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}
