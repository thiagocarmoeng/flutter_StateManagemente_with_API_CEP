import 'package:flutter_application_2/src/model/cep_model.dart';
import 'package:uno/uno.dart';

class CepRepository {
  final Uno uno;
  CepRepository(this.uno);

  Future<CepModel> fetchCep(String cep) async {
    var path = 'https://viacep.com.br/ws/$cep/json/';
    final response = await uno.get(path);
    var oData = CepModel.fromMap(response.data);
    return oData;
  }
}
