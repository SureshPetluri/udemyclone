
import 'package:get_storage/get_storage.dart';

class SignInRepository{
 static final GetStorage signInRepo =  GetStorage("SignIn");

  static loginComplete(String complete){
    return signInRepo.write("login", complete);
  }
  static String complete()=>signInRepo.read("login") ?? "";
}