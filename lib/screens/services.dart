

import 'package:get/get.dart';

class  DataService extends GetConnect implements GetxService{

  Future<Response> getData () async{

    Response response= await get("https://alive-pig-petticoat.cyclic.app/",
    headers: {
      'content-Type':"application/json; charset=UTF-8"
    }
    );
    

    return response;
  


  }

}