import 'dart:math';

import 'package:http/http.dart';
import 'dart:convert';

class GetQuote {

  Future <Map> randomNum() async {
    // Random Num
    var rng = new Random();

    // Get Data
    Response res = await get(Uri.parse('https://type.fit/api/quotes'));
    List data = jsonDecode(res.body);
    Map dataMap = data[rng.nextInt(data.length)];
    return dataMap;
  }
}
