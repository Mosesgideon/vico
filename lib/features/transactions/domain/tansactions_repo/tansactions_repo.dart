import 'package:vico/features/transactions/data/models/all_transactions.dart';

abstract class TransactionRepository
{
  Future<AllTransactionsResponse>transactions();
}