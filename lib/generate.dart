import 'dart:io';
import 'dart:math';

void password() {
  int length, choice;
  String chars = 'abcdefghijklmnopqrstuvqxyz', generated = '';
  Map<String, String> types = {
    'uppercase letters': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
    'numbers': '0123456789',
    'symbols': '~`! @#\$%^&*()_-+={[}]|\\:;"\'<,>.?/',
  };
  stdout.write('\nPassword length: ');
  length = int.parse(stdin.readLineSync()!);
  for (var type in types.entries) {
    stdout.write('\nNeed ${type.key}?\n(1) Yes\n(2) No\nChoice: ');
    choice = int.parse(stdin.readLineSync()!);
    chars += (choice == 1) ? type.value : '';
  }
  for (var i = 1; i <= length; i++) {
    generated += chars[Random().nextInt(chars.length)];
  }
  stdout.writeln('\nPassword = $generated');
}
