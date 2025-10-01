import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/services/network/url_config.dart';
import 'package:vico/features/account/data/models/account_response.dart';
import 'package:vico/features/account/data/models/company_accont.dart';
import 'package:vico/features/account/domain/repo/profile_repo.dart';

import '../models/edit_pro_response.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  NetworkService networkService;
  ProfileRepositoryImpl(this.networkService);
  @override
  Future<EditprofileResponse> editprofile(
    String firstname,
    String lastname,
    String number,
    String address,
    String state,
  ) async {
    var response = await networkService.call(
      UrlConfig.editprofile,
      RequestMethod.patch,
      data: {
        "firstName": firstname,
        "lastName": lastname,
        "primaryPhone": number,
        "primaryAddress": address,
        "state": state,
      },
    );
    return EditprofileResponse.fromJson(response.data);
  }

  @override
  Future<EditprofileResponse> profile() async {
    var response = await networkService.call(
      UrlConfig.profile,
      RequestMethod.get,
    );
    return EditprofileResponse.fromJson(response.data);
  }

  @override
  Future<GetUserAccontResponse> getBanks() async {
    var response = await networkService.call(
      UrlConfig.getbank,
      RequestMethod.get,
    );
    return GetUserAccontResponse.fromJson(response.data);
  }

  @override
  Future<CompanyAccountResponse> companyAccount() async {
    var response = await networkService.call(
      UrlConfig.companyAccount,
      RequestMethod.get,
    );
    return CompanyAccountResponse.fromJson(response.data);
  }
}
