import 'dart:convert';

import 'package:http/http.dart' as http;

class PersonProvider {
  static Future<String> getData() async {
    final url = "https://randomuser.me/api/0.4/?randomapi";
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else {
      print("Use fake info");
      return "{ \"results\": [ {\"user\": {\"gender\": \"female\",\"name\": {\"title\": \"miss\",\"first\": \"bobbie\",\"last\": \"phillips\"},\"location\": {\"street\": \"1130 w alexander rd\",\"city\": \"los lunas\",\"state\": \"alabama\",\"zip\": \"26925\"},\"email\": \"bobbie.phillips80@example.com\",\"username\": \"bigbear812\",\"password\": \"bathing\",\"salt\": \"e1UarUIG\",\"md5\": \"38b3a0444a1bb8605f91c66b7c3d6a68\",\"sha1\": \"151cabcc647e6859d94149606199b6661325f192\",\"sha256\": \"44e8aca85f34da3c867ff9484c314a18fe444ecd5b1a3998992eaf8561ba2256\",\"registered\": \"1529542753\",\"dob\": \"249851459\",\"phone\": \"(578)-352-2208\",\"cell\": \"(437)-112-4321\",\"SSN\": \"635-30-7739\",\"picture\": \"http://api.randomuser.me/portraits/women/4.jpg\"},\"seed\": \"a232d8f448758240\",\"version\": \"0.4\" } ]}";
      // throw Exception("Unable to perform request!");
    }
  }

  static Future<Map<String, dynamic>> getResult() async {
    final String data = await getData();
    var jsonData = jsonDecode(data);
    var result = jsonData["results"][0];
    return result["user"];
  }
}
