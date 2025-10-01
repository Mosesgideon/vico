import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/services/network/url_config.dart';
import 'package:vico/features/transactions/data/models/all_transactions.dart';

import '../../domain/tansactions_repo/tansactions_repo.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  NetworkService networkService;
  TransactionRepositoryImpl(this.networkService);
  @override
  Future<AllTransactionsResponse> transactions() async {
    var response = await networkService.call(
      UrlConfig.alltransactions,
      RequestMethod.get,
    );
    return AllTransactionsResponse.fromJson(response.data);
  }
}
