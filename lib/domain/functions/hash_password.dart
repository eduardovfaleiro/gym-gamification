import 'dart:convert';

import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  List<int> bytes = utf8.encode(password);
  Digest digest = sha256.convert(bytes);
  return digest.toString();
}
