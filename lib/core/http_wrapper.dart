
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:retry/retry.dart';

class HttpWrapper {

  // Generic method to make GET requests
  static Future<Response> get({
    required Client client, 
    required String url, 
    required Map<String, String> headers
  }) async {
    final response = await retry(
      () => client.get(
        Uri.parse(url),
        headers: headers
      ),
      maxAttempts: 3,
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return response;
  }

  static Future<Response> post({
    required Client client, 
    required Object? body,
    required String url, 
    required Map<String, String> headers
  }) async {
    final response = await retry(
      () => client.post(
        Uri.parse(url),
        headers: headers,
        body: body
      ),
      maxAttempts: 3,
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return response;
  }
  static Future<Response> put({
    required Client client, 
    required Object? body,
    required String url, 
    required Map<String, String> headers
  }) async {
    final response = await retry(
      () => client.put(
        Uri.parse(url),
        headers: headers,
        body: body
      ),
      maxAttempts: 3,
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return response;
  }
  static Future<Response> delete({
    required Client client, 
    required String url, 
    required Map<String, String> headers
  }) async {
    final response = await retry(
      () => client.delete(
        Uri.parse(url),
        headers: headers,
      ),
      maxAttempts: 3,
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return response;
  }
}