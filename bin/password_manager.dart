import 'dart:io';
import 'package:password_manager/generate.dart' as generate;
import 'package:password_manager/hash.dart' as hash;

void main(List<String> arguments) {
  int choice;
  stdout.write(
    'Password Manager\n(1) Generate Password\n(2) Hash Password\nChoice: ',
  );
  choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      generate.password();
      break;
    case 2:
      hash.password();
      break;
    default:
      stdout.writeln('Invalid!');
      break;
  }
}
