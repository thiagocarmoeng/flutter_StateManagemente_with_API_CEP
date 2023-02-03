import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/model/cep_model.dart';
import 'package:flutter_application_2/src/views/cep_state.dart';

import '../repository/cep_repository.dart';

class CepStore extends ValueNotifier<CepState> {
  CepStore(this.getCep) : super(InitialCepState());

  final CepRepository getCep;

  Future fetchCep(String cep) async {
    value = LoadingCepState();
    await Future.delayed(Duration(seconds: 1));
    try {
      final response = await getCep.fetchCep(cep);
      value = SuccessCepState(response);
    } catch (e) {
      value = ErrorCepState(e.toString());
    }
  }
}
