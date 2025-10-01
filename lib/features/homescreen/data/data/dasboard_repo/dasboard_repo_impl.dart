 import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/services/network/url_config.dart';
import 'package:vico/features/homescreen/data/models/dasbboard_response.dart';

import '../../../domain/dasboard_repo/dsahboard_repo.dart';

class DashboardRepositoryImpl extends DashboardRepository{
   NetworkService networkService;
   DashboardRepositoryImpl(this.networkService);
  @override
  Future<DasboardSuccessResponse> getUserdashh() async {
    var response=await networkService.call(UrlConfig.getdash, RequestMethod.get);
    return DasboardSuccessResponse.fromJson(response.data);
  }
}