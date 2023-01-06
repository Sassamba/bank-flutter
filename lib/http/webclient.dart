import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'interceptors/loggin_interceptor.dart';

const String URL = "http://172.29.9.109:8080/transactions";
final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);
