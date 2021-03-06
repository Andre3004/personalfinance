
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';


final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()], requestTimeout: Duration(seconds: 5));
const String address = "192.168.15.12:8080";
const String service = "transactions";
Uri baseUri = Uri.http(address, service);

