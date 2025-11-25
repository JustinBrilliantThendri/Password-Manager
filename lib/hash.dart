import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:async';

Future<String> getSalt() async {
  final file = File('data/salt.txt');
  String salt = '';
  if (await file.exists()) {
    salt = await file.readAsString();
  }
  return salt;
}

Future<void> password() async {
  dynamic bytes, digest, key;
  String password, hashed, salt = await getSalt();
  int choice;
  stdout.write("\nPassword: ");
  password = stdin.readLineSync()!;
  stdout.write(
    '\nAlgorithm:\n(1) SHA-256\n(2) SHA-512\n(3) MD5\n(4) HMAC SHA-256\n(5) HMAC SHA-512\nChoice: ',
  );
  choice = int.parse(stdin.readLineSync()!);
  bytes = utf8.encode(password);
  switch (choice) {
    case 1:
      digest = sha256.convert(bytes);
      break;
    case 2:
      digest = sha512.convert(bytes);
      break;
    case 3:
      digest = md5.convert(bytes);
      break;
    case 4:
      if (salt != '') {
        key = utf8.encode(salt);
        final hmac = Hmac(sha256, key);
        digest = hmac.convert(bytes);
      } else {
        stdout.writeln('\nThere is no salt!');
        return;
      }
      break;
    case 5:
      if (salt != '') {
        key = utf8.encode(salt);
        final hmac = Hmac(sha512, key);
        digest = hmac.convert(bytes);
      } else {
        stdout.writeln('\nThere is no salt!');
        return;
      }
      break;
    default:
      stdout.writeln('\nInvalid!');
      return;
  }
  hashed = digest.toString();
  stdout.writeln('\nHashed password = $hashed');
}
