import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/services/network/url_config.dart';
import 'package:vico/features/search/data/models/all_sub_category.dart';
import 'package:vico/features/search/data/models/search_response.dart';
import 'package:vico/features/search/domain/repo.dart';

class AllSubCategoriesRepositoryImpl extends AllSubCategoriesRepository {
  NetworkService networkService;
  AllSubCategoriesRepositoryImpl(this.networkService);
  @override
  Future<AllSubCategoryResspomse> allsubcat() async {
    var response = await networkService.call(
      UrlConfig.allsubcat,
      RequestMethod.get,
    );
    return AllSubCategoryResspomse.fromJson(response.data);
  }

  @override
  Future<SearchResponse> search(String query) async {
    var response = await networkService.call(
      UrlConfig.search,
      RequestMethod.get,
      queryParams: {"q":query}
    );
    return SearchResponse.fromJson(response.data);
  }
}
