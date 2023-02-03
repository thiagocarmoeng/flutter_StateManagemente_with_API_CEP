import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/repository/cep_repository.dart';
import 'package:flutter_application_2/src/views/cep_state.dart';
import 'package:flutter_application_2/src/views/cep_store.dart';
import 'package:flutter_application_2/src/views/home/components/list_data.dart';
import 'package:uno/uno.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final state = CepStore(CepRepository(Uno()));

  TextEditingController cepText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Center(child: Text('Busca CEP'))),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: cepText,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Insert CEP for Search'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () => state.fetchCep(cepText.text),
                          child: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ValueListenableBuilder(
                    valueListenable: state,
                    builder: (_, state, child) {
                      if (state is LoadingCepState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ErrorCepState) {
                        return Center(child: Text(state.message));
                      }
                      if (state is SuccessCepState) {
                        var cep = state.cep;
                        return ListData(value: cep);
                      }
                      return Container();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
