// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

abstract class Authentication {
  Future<dynamic> auth(AuthenticationParams params);
  Future<dynamic> signUp(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String nome;
  final String cpf;
  final String secret;

  const AuthenticationParams(
      {required this.cpf, required this.secret, this.nome = ""});

  @override
  List get props => [cpf, secret, nome];
}
