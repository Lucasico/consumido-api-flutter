import 'dart:async';
import 'package:http/http.dart' as http;

class PersonagemAPI{
  static Future getPersonagens(){
    Uri url = Uri.parse("https://api.jikan.moe/v4/anime?page=1");
    return http.get(url);
  }
}