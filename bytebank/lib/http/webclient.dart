
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';


final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()],);
const String address = "192.168.15.7:8080";
const String service = "transactions";
Uri baseUri = Uri.http(address, service);




