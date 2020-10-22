import 'dart:convert';

import 'package:http/http.dart';

import '../exceptions.dart';
import 'auth_token_storage.dart';

class SRHttpClient {
  static SRHttpClient _client;

  final Client _baseClient = Client();
  static String rootPath = "http://api.svetosystem.ru";

  AuthTokenStorage _tokenStorage;

  static init() async {
    if (_client == null) {
      _client = SRHttpClient._();
    }
  }

  factory SRHttpClient() {
    if (_client == null) {
      _client = SRHttpClient._();
    }
    return _client;
  }

  SRHttpClient._() {
    _tokenStorage = AuthTokenStorage();
  }

  Future<dynamic> get(String path, {Map<String, dynamic> params, useToken = true, parseJson = true}) async {
    String requestUrl;
    if (path.startsWith("https://") || path.startsWith("http://")) {
      requestUrl = path;
    } else {
      requestUrl = rootPath;
      if (path.startsWith("/"))
        requestUrl += path;
      else
        requestUrl += "/" + path;
    }
    if (params != null) {
      requestUrl += "?" +
          params.entries.map((e) {
            return "${e.key}=${Uri.encodeQueryComponent(e.value.toString())}";
          }).join("&");
    }
    var res = await _baseClient.get(requestUrl, headers: await _generateHeader(useToken));
    print(requestUrl);
    print(res.body);
    var servedResponse;
    if (parseJson) {
      servedResponse = jsonDecode(res.body);
    } else {
      servedResponse = res.body;
    }
    return servedResponse;
  }

  Future<dynamic> post(String path, {body, useToken = true}) async {
    String requestUrl;
    if (path.startsWith("https://") || path.startsWith("http://")) {
      requestUrl = path;
    } else {
      requestUrl = rootPath;
      if (path.startsWith("/"))
        requestUrl += path;
      else
        requestUrl += "/" + path;
    }
    var res = await _baseClient.post(requestUrl, body: jsonEncode(body), headers: await _generateHeader(useToken));
    print(requestUrl);
    print(json.encode(body));
    print(res.body);
    var jsonObj = jsonDecode(res.body);
    return jsonObj;
  }

  Future<Map<String, String>> _generateHeader(useToken) async {
    String token;
    if (useToken) {
      try {
        token = await _tokenStorage.getAuthToken();
      } catch (e) {
        throw TokenNotFoundException();
      }
    }
    return {"token": token, 'Content-Type': 'application/json'};
  }
}
