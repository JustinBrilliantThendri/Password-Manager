import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void password() {
  dynamic bytes, digest;
  String password, hashed;
  int choice;
  stdout.write("\nPassword: ");
  password = stdin.readLineSync()!;
  stdout.write(
    '\nAlgorithm:\n(1) SHA-1\n(2) SHA-256\n(3) SHA-512\n(4) SHA-512/256\n(5) MD5\nChoice: ',
  );
  choice = int.parse(stdin.readLineSync()!);
  bytes = utf8.encode(password);
  switch (choice) {
    case 1:
      digest = sha1.convert(bytes);
      break;
    case 2:
      digest = sha256.convert(bytes);
      break;
    case 3:
      digest = sha512.convert(bytes);
      break;
    case 4:
      digest = sha512256.convert(bytes);
      break;
    case 5:
      digest = md5.convert(bytes);
      break;
  }
  hashed = digest.toString();
  stdout.writeln('\nHashed password = $hashed');
}
