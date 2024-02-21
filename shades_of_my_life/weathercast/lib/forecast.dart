import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJmNmFkZmZiOTNhMDk3MzdiYmQ5ZmQ1NTNkNmI2NDMxZmQ1YjVmNzM0YzUyNTlhYjgyZjBjZTU2ZTRkMjJkNzA0MmQ0MzY4MGJmYjhjZGM2In0.eyJhdWQiOiIyIiwianRpIjoiMmY2YWRmZmI5M2EwOTczN2JiZDlmZDU1M2Q2YjY0MzFmZDViNWY3MzRjNTI1OWFiODJmMGNlNTZlNGQyMmQ3MDQyZDQzNjgwYmZiOGNkYzYiLCJpYXQiOjE3MDc4ODI0NjgsIm5iZiI6MTcwNzg4MjQ2OCwiZXhwIjoxNzM5NTA0ODY4LCJzdWIiOiIzMDE2Iiwic2NvcGVzIjpbXX0.t8swgZ7vySrI-bBhMTP39ik6QIqXvIjOwrilSMJ0m6defxMtibzPKYvRiBkHTs9vEVPjhrkqBZj4xGIagpg97biHx_WQmw_FoVpZLX_kptqLsbgln4TAbSX6ddP5Fzx0Tgrr8ry-JsVlNw6ICjCL5p8LkR6o_2LkOfPA3QUoaqscT51aEb6sG1Ba8iAO9ftVqqDk0CIsZdKadwcCACEFYBOfHVKLIhCY5qzT_tfFPhIcqid7qyqGC2T1EazycfGuv8kpwAfnR3TDBsEucdsneUjp_rx-pdtCiTbB_w07GUKAQ1KCTzic435ida23xP3uNHSJcSX0A5xbebjpyPVma0fHpQ0vC_xZ6DplhCA8g2_yncWBR62xqDy2dFeL07namJ1Aj0Pq25Kv2l9Gt__NL9X1UR95L1lO_CVkWwmgpdjoQjUZCsY8Wkx4bwVt1sfvNdw_e6Etz9co4J6E3Pf1agB-ZyadyyI0SXQgEZN14jXo_oydei9AV9LhjngN3WvX3AUbPXxQNfjgI89lPNrHUgxvO28iO1pEWHPioYSgGI6V0Lmx4LywNbfzBedQqTQhNI02cCqVFYIiu9kqDdtmtrxPc-Ajo3paA-JzGmkC_Eh2f-NPf6m673kFFpqXodICRh4cJQpaUozNLhYs5VjkdMhRpxrB4GRaB2cvpvLiFbc';

  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["WeatherForecasts"][0]["forecasts"]
          [0]["data"];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
          address: '${address.subLocality}\n${address.administrativeArea}',
          temperature: result['tc'],
          cond: result['cond']);
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
