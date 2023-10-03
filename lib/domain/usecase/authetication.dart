// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

abstract class Authentication {
  Future<dynamic> auth(AuthenticationParams params);
  Future<dynamic> signUp(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String nome;
  final String email;
  final String secret;
  final String cpf;

  const AuthenticationParams(
      {required this.email,
      required this.secret,
      this.nome = "",
      this.cpf = ""});

  @override
  List get props => [email, secret, nome, cpf];
}
