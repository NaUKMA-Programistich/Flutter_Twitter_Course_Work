import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';

extension StringExtension on String {
  String encode() {
    return percent.encode(utf8.encode(this));
  }
}

extension MapExtensions on Map<String, String> {
  List<String> toList() {
    return keys
        .map((key) => "${(key).encode()}=${(this[key]!).encode()}")
        .toList()
      ..sort();
  }

  String toReadString() {
    List<String> list = keys
        .map((key) => "${key.encode()}=\"${this[key]!.encode()}\"")
        .toList();
    return list.join(', ');
  }
}

extension DateExtension on DateTime {
  String timestamp() {
    return (millisecondsSinceEpoch ~/ 1000).toString();
  }
}

extension RandomExtension on Random {
  String generateNonce() {
    List<int> codeUnits = List.generate(10, (index) {
      return nextInt(26) + 97;
    });
    return String.fromCharCodes(codeUnits);
  }
}
