import 'dart:io';
import 'dart:async';

Future<void> storeSalt() async {
  String salt;
  final file = File('data/salt.txt');
  stdout.write("\nSalt: ");
  stdin.echoMode = false;
  salt = stdin.readLineSync()!;
  stdin.echoMode = true;
  if (await file.parent.exists()) {
    await file.writeAsString('');
  } else {
    await file.parent.create(recursive: true);
  }
  await file.writeAsString(salt);
  stdout.writeln("Your salt has been stored!");
}
