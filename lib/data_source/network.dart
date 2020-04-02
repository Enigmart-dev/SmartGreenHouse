import 'package:http/http.dart' as http;

final String url = "http://www.serraris.altervista.org/root.json";

class NetworkAPI {
  //These makes the class a Singleton
  static final NetworkAPI _networkAPI = NetworkAPI._internal();
  factory NetworkAPI() => _networkAPI;
  NetworkAPI._internal();

  final client = http.Client();

  Future<http.Response> fetchJSON(){
    return client.get(url);
  }
}