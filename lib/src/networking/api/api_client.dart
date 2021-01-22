import 'package:dio/dio.dart';
import 'package:mon_tech_bank/src/networking/data/entities/account.dart';
import 'package:mon_tech_bank/src/networking/data/entities/user.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/{id}")
  Future<User> geDefaultUser(@Path("id") String defaultUserId);

  @GET("/{id}")
  Future<List<Account>> getAllAccounts(@Path("id") String accountListsId);
}
