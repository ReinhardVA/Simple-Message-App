import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
void main(List<String> args) {
  String? name = "Eren";
  String? password = "GucluParola123";
  String salt = generateSalt(16);
  String hashedPassword = hashPassword(password);
  String hashedName = hashPassword(name);

  print("Enter your name: ");
  String? userNameInput = stdin.readLineSync();
  String hashedNameInput = hashPassword(userNameInput!);
  print("Enter your password");
  String? userPasswordInput = stdin.readLineSync();
  String hashedPasswordInput = hashPassword(userPasswordInput!);

  if(hashedName == hashedNameInput && hashedPassword == hashedPasswordInput){
    print("Your message : ");
    String? yourMessage = stdin.readLineSync();
    String? combinedString = yourMessage ?? "" + password + salt;
    String? hashedMessage = hashPassword(combinedString);
    String? hashedMessageCombinedString = yourMessage ?? "" + password + salt;
    String? hashedMessage2 = hashPassword(hashedMessageCombinedString);

    if(hashedMessage == hashedMessage2){
      print(yourMessage);
    }
  }
}
String generateSalt(int length) {
  // Generate a random salt using a secure random number generator
  final random = Random.secure();
  var codeUnits = List.generate(length, (_) => random.nextInt(256));
  return String.fromCharCodes(codeUnits);
}
String hashPassword(String input) {
  var bytes = utf8.encode(input);
  var hash = sha256.convert(bytes);
  return hash.toString();
}