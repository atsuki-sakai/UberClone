import 'package:geolocator/geolocator.dart';
import 'package:uber_clone/services/http_client.dart';

class MapClient {
  static Future<String?> searchCoordinateAddress(Position? position) async {
    if(position == null) return null;
    String _apiKey = "AIzaSyBYxhdnLgAha8_oJgsjSq4PdCabx30LYfc";
    String placeAddress = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${_apiKey}";
    try{
      final response = await HttpClient.getRequest(url);
      placeAddress = response["results"][0]["formatted_address"];
      return placeAddress;
    }on Exception catch(error){
      print(error.toString());
      return null;
    }catch(error){
      print(error.toString());
      return null;
    }

  }
}
