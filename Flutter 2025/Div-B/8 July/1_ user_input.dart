import 'dart:io';

void main() {
  print('Enter your name: ');
  String? name = stdin.readLineSync();
  print('Hello, $name!');
}