import 'package:get_it/get_it.dart';
import 'package:mon_tech_bank/src/networking/api/api_client.dart';
import 'package:mon_tech_bank/src/networking/data/entities/user.dart';

class UserRepository {
  User user;
  ApiClient apiClient;

  UserRepository({ApiClient apiClient}) {
    this.apiClient = apiClient ?? GetIt.instance<ApiClient>();
  }

  Future<User> getDefault(String id) async {
    return user = await apiClient.geDefaultUser(id);
  }
}
