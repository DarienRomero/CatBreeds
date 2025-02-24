import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final int statusCode;
  final List<String> messages;

  const Failure({
    required this.statusCode,
    required this.messages
  });
  
  @override
  List<Object> get props => [messages];
}

class UnknownFailure extends Failure{
  const UnknownFailure({
    required super.statusCode, 
    required super.messages
  });
  static get exception => const UnknownFailure(
    messages: ["Error desconocido"], 
    statusCode: 406
  );
}

class NotFoundFailure extends Failure{
  const NotFoundFailure({
    required super.statusCode, 
    required super.messages
  });
  static get exception => const UnknownFailure(
    messages: ["No encontrado"], 
    statusCode: 405
  );
}

class NetworkFailure extends Failure{
  const NetworkFailure({
    required super.statusCode, 
    required super.messages
  });
  static get exception => const NetworkFailure(
    messages: ["Connection error"], 
    statusCode: 500
  );
}

InvalidDataFailure invalidDataFailureFromMap(String str) => InvalidDataFailure.fromMap(json.decode(str));

class InvalidDataFailure extends Failure{
  const InvalidDataFailure({
    required super.statusCode, 
    required super.messages
  });

  factory InvalidDataFailure.fromMap(Map<String, dynamic> json) => InvalidDataFailure(
    statusCode: json["status_code"]  ?? -1,
    messages: json["message"] != null ? ( (json["message"] is String) ? [json["message"]] : List<String>.from(json["message"])) : [],
  );
}