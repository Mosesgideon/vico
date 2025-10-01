
import '../../data/models/account_response.dart';
import '../../data/models/edit_pro_response.dart';

abstract class ProfileRepository{
  Future<EditprofileResponse>editprofile(String firstname,String lastname,String number,String address,String state);
  Future<EditprofileResponse>profile();
  Future<GetUserAccontResponse>getBanks();
}