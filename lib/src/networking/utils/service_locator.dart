import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mon_tech_bank/src/common/app_settings.config.dart';
import 'package:mon_tech_bank/src/common/config.dart';
import 'package:mon_tech_bank/src/networking/api/api_client.dart';
import 'package:mon_tech_bank/src/networking/data/repositories/account_repository.dart';
import 'package:mon_tech_bank/src/networking/data/repositories/user_repository.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static const DEFAULT_CONNECTION_TIMEOUT = const Duration(seconds: 10);
  static const DEFAULT_RECEIVE_TIMEOUT = const Duration(seconds: 10);

  // Only use for Testing/DEV
  static Future<void> initForDev() async {
    Config.appFlavor = Flavor.DEV;
    try {
      GlobalConfiguration().loadFromMap(appSettings);
      await init();
    } on ArgumentError catch (e) {
      print("Ignoring exception ${e.toString()}");
    }
  }

  static Future<void> init() async {
    await _registerNetwork();
    await _registerRepositories();
  }

  // Used to clean up the Service Locator - For Testing
  static Future<void> tearDown() async {
    await sl.reset();
  }

  /// Register all the networking components
  static Future<void> _registerNetwork() async {
    var dio = _buildDio();
    for (int i = 0; i < dio.options.headers.length; i++) {
      Map<String, dynamic> headers = dio.options.headers;
      headers.forEach((key, value) {
        print("Key: $key Value: $value");
      });
    }
    ApiClient apiClient = ApiClient(dio, baseUrl: dio.options.baseUrl);

    if (!sl.isRegistered(instance: dio)) {
      sl.registerSingleton(dio);
      print(dio.options.baseUrl);
    }
    if (!sl.isRegistered(instance: apiClient)) {
      sl.registerLazySingleton(() => apiClient);
    }
  }

  ServiceLocator();

  static Dio _buildDio() {
    print("Service locator ${Config.baseURL}");
    BaseOptions options = BaseOptions(
      baseUrl: Config.baseURL,
      connectTimeout: DEFAULT_CONNECTION_TIMEOUT.inMilliseconds,
      receiveTimeout: DEFAULT_RECEIVE_TIMEOUT.inMilliseconds,
    );

    final dio = Dio(options)
      ..transformer = FlutterTransformer()
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    return dio;
  }

  /// Register all the repositories
  static Future<void> _registerRepositories() async {
    UserRepository userRepository = UserRepository();
    AccountRepository accountRepository = AccountRepository();


    if (!sl.isRegistered(instance: userRepository)) {
      sl.registerFactory<UserRepository>(() => userRepository);
    }
    if (!sl.isRegistered(instance: accountRepository)) {
      sl.registerFactory<AccountRepository>(() => accountRepository);
    }
  }
}