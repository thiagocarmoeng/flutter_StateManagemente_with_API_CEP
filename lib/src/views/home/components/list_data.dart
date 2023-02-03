// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/model/cep_model.dart';

import 'left_title.dart';
import 'rigth_title.dart';

class ListData extends StatelessWidget {
  const ListData({
    Key? key,
    required this.value,
  }) : super(key: key);
  final CepModel value;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(children: [
          LeftTitle(title: 'Cep:'),
          RigthTitle(title: value.cep),
        ]),
        TableRow(children: [
          LeftTitle(title: 'Logradouro:'),
          RigthTitle(title: value.logradouro),
        ]),
        TableRow(children: [
          LeftTitle(title: 'Complemento:'),
          RigthTitle(title: value.complemento)
        ]),
        TableRow(children: [
          LeftTitle(title: 'Bairro:'),
          RigthTitle(title: value.bairro),
        ]),
        TableRow(children: [
          LeftTitle(title: 'Localidade:'),
          RigthTitle(title: value.localidade)
        ]),
        TableRow(children: [
          LeftTitle(title: 'UF:'),
          RigthTitle(title: value.uf),
        ]),
        TableRow(children: [
          LeftTitle(title: 'IBGE:'),
          RigthTitle(title: value.ibge),
        ]),
        TableRow(children: [
          LeftTitle(title: 'Gia:'),
          RigthTitle(title: value.gia),
        ]),
        TableRow(children: [
          LeftTitle(title: 'DDD:'),
          RigthTitle(title: value.ddd),
        ]),
        TableRow(children: [
          LeftTitle(title: 'Siafi:'),
          RigthTitle(title: value.siafi),
        ]),
      ],
    );
  }
}
