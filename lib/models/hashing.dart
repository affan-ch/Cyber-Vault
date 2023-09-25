import 'dart:typed_data';
import 'package:argon2/argon2.dart';
import 'dart:math';

String generateSalt() {
  final random = Random.secure();
  final saltBytes = List<int>.generate(32, (_) => random.nextInt(256));
  final salt = String.fromCharCodes(saltBytes);
  return salt;
}

String hashPassword(String password, Uint8List salt) {
  var parameters = Argon2Parameters(Argon2Parameters.ARGON2_i, salt,
      version: Argon2Parameters.ARGON2_VERSION_13,
      iterations: 2,
      lanes: 4,
      memoryPowerOf2: 8,
      converter: CharToByteConverter.ASCII);

  var argon2 = Argon2BytesGenerator();

  argon2.init(parameters);

  var passwordBytes = parameters.converter.convert(password);

  var result = Uint8List(32);
  argon2.generateBytes(passwordBytes, result, 0, result.length);

  var resultHex = result.toHexString();

  return resultHex;
}
