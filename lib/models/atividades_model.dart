import 'dart:convert';

class AtividadesModel {
  int? idAtividade;
  int idTurmas;
  String nomeAtividade;
  String descricaoAtividade;
  String dataEntregaAtividade;
  int PesoNotaAtividades;
  
  AtividadesModel({
    this.idAtividade,
    required this.idTurmas,
    required this.nomeAtividade,
    required this.descricaoAtividade,
    required this.dataEntregaAtividade,
    required this.PesoNotaAtividades,
  });


  Map<String, dynamic> toMap() {
    return {
      'idAtividade': idAtividade,
      'idTurmas': idTurmas,
      'nomeAtividade': nomeAtividade,
      'descricaoAtividade': descricaoAtividade,
      'dataEntregaAtividade': dataEntregaAtividade,
      'PesoNotaAtividades': PesoNotaAtividades,
    };
  }

  factory AtividadesModel.fromMap(Map<String, dynamic> map) {
    return AtividadesModel(
      idAtividade: map['idAtividade']?.toInt(),
      idTurmas: map['idTurmas']?.toInt() ?? 0,
      nomeAtividade: map['nomeAtividade'] ?? '',
      descricaoAtividade: map['descricaoAtividade'] ?? '',
      dataEntregaAtividade: map['dataEntregaAtividade'] ?? '',
      PesoNotaAtividades: map['PesoNotaAtividades']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AtividadesModel.fromJson(String source) => AtividadesModel.fromMap(json.decode(source));

}
