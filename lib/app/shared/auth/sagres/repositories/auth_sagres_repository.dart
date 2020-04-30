import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

import '../../../constants.dart';

class AuthSagresRepository {
  final ILocalStorage storage = Modular.get();

  final Dio dio;

  AuthSagresRepository(this.dio);

  Future<String> loginValidation(List<String> credentials) async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/validation/",
      data: credentials,  
    );

    String status = '';

    for (var json in (response.data)) {
      status = json['status'];
    }
    
    return status;
  }
  
  getCredentials() async{
    List<String> credentials = await storage.get('credentials');
    return credentials;
  }
  
  saveCredentials(List<String> credentials) {
    storage.put('credentials', credentials);
  }

  deleteCredentials() {
    storage.put('credentials', null);
  }
}
