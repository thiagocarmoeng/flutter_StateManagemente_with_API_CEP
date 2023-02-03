import 'package:flutter_application_2/src/model/cep_model.dart';

abstract class CepState {}

class InitialCepState extends CepState {}

class SuccessCepState extends CepState {
  SuccessCepState(this.cep);
  final CepModel cep;
}

class LoadingCepState extends CepState {}

class ErrorCepState extends CepState {
  ErrorCepState(this.message);
  final String message;
}
