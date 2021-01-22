import 'package:get_it/get_it.dart';
import 'package:mon_tech_bank/src/networking/api/api_client.dart';
import 'package:mon_tech_bank/src/networking/data/entities/account.dart';

class AccountRepository {
  Account account;
  ApiClient apiClient;
  List<Account> accounts;

  AccountRepository({ApiClient apiClient}) {
    this.apiClient = apiClient ?? GetIt.instance<ApiClient>();
  }

  Future<List<Account>> getAccounts(String id) async {
    return accounts = await apiClient.getAllAccounts(id);
  }
}
