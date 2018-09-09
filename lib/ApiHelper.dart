import 'package:http/http.dart' as http;
import 'dart:async';


const baseUrl = "https://jsonplaceholder.typicode.com";

class ApiHelper{
  static Future getAllUsers(){
    return http.get(baseUrl+"/users");
  }

  static Future getOneUser(String id){
    return http.get(baseUrl+"/users/"+id);
  }

}