import 'dart:convert';
import 'dart:math';
// import 'package:http/http.dart' as http;

class PersonProvider {
  static Future<String> getData() async {
    var rng = new Random();
    var id = rng.nextInt(98) + 1;
    return '{"results": [{"gender": "female","name": {"title": "miss","first": "ramona-$id","last": "carter"}, "location": {"street": "2286 frances ct","city": "townsville","state": "queensland","postcode": 6699},"email": "ramona.carter@example.com","login": {"username": "bigrabbit281","password": "salvador","salt": "NgEKDglD","md5": "8946b15e0a5411bfdb52df5ac1b90520","sha1": "f460f12a714919499d413a69a76ca2f262e9c198","sha256": "fbb37b276b0900fcfdcfc47f0584f9859726c3791b9b0e453dbac8178be26412"},"dob": "1977–05–01 13:29:43","registered": "2009–05–12 00:46:03","phone": "08–4889–2804","cell": "0479–076–830","id": {"name": "TFN","value": "212902602$id"},"picture": {"large": "https://randomuser.me/api/portraits/women/$id.jpg","medium": "https://randomuser.me/api/portraits/med/women/$id.jpg","thumbnail": "https://randomuser.me/api/portraits/thumb/women/$id.jpg"},"nat": "AU"}],"info": {"seed": "7d4db9727474515a","results": 1,"page": 1,"version": "1.1"}}';
    // final url = "https://randomuser.me/api/0.4/?randomapi";
    // final res = await http.get(url);
    // if (res.statusCode == 200) {
    //   return res.body;
    // } else {
    //   print("Use fake info");
    //   var rng = new Random();
    //   var id = rng.nextInt(98) + 1;
    //   return '{"results": [{"gender": "female","name": {"title": "miss","first": "ramona-$id","last": "carter"}, "location": {"street": "2286 frances ct","city": "townsville","state": "queensland","postcode": 6699},"email": "ramona.carter@example.com","login": {"username": "bigrabbit281","password": "salvador","salt": "NgEKDglD","md5": "8946b15e0a5411bfdb52df5ac1b90520","sha1": "f460f12a714919499d413a69a76ca2f262e9c198","sha256": "fbb37b276b0900fcfdcfc47f0584f9859726c3791b9b0e453dbac8178be26412"},"dob": "1977–05–01 13:29:43","registered": "2009–05–12 00:46:03","phone": "08–4889–2804","cell": "0479–076–830","id": {"name": "TFN","value": "212902602$id"},"picture": {"large": "https://randomuser.me/api/portraits/women/$id.jpg","medium": "https://randomuser.me/api/portraits/med/women/$id.jpg","thumbnail": "https://randomuser.me/api/portraits/thumb/women/$id.jpg"},"nat": "AU"}],"info": {"seed": "7d4db9727474515a","results": 1,"page": 1,"version": "1.1"}}';
    //   // return "{ \"results\": [ {\"user\": {\"gender\": \"female\",\"name\": {\"title\": \"miss\",\"first\": \"bobbie\",\"last\": \"phillips\"},\"location\": {\"street\": \"1130 w alexander rd\",\"city\": \"los lunas\",\"state\": \"alabama\",\"zip\": \"26925\"},\"email\": \"bobbie.phillips80@example.com\",\"username\": \"bigbear812\",\"password\": \"bathing\",\"salt\": \"e1UarUIG\",\"md5\": \"38b3a0444a1bb8605f91c66b7c3d6a68\",\"sha1\": \"151cabcc647e6859d94149606199b6661325f192\",\"sha256\": \"44e8aca85f34da3c867ff9484c314a18fe444ecd5b1a3998992eaf8561ba2256\",\"registered\": \"1529542753\",\"dob\": \"249851459\",\"phone\": \"(578)-352-2208\",\"cell\": \"(437)-112-4321\",\"SSN\": \"635-30-7739\",\"picture\": \"http://api.randomuser.me/portraits/women/4.jpg\"},\"seed\": \"a232d8f448758240\",\"version\": \"0.4\" } ]}";
    //   // throw Exception("Unable to perform request!");
    // }
  }

  static Future<Map<String, dynamic>> getResult() async {
    final String data = await getData();
    var jsonData = jsonDecode(data);
    var result = jsonData["results"][0];
    if (result["user"] != null) return result["user"];
    return result;
  }
}
