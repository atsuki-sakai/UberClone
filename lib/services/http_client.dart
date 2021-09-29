import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  static Future<dynamic> getRequest(String url) async {
    try{
      final http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return decodeData;
      }else{
        throw Exception('HttpReques bad statas. STATUSCODE => ${response.statusCode}');
      }
    }catch(error){
      throw Exception('Unknow error... ERROR: ${error.toString()}');
    }
  }
}
