import 'dart:convert';

class TurmasModel {
  int? idTurmas;
  String nomeTurma;
  String periodoLetivo;
  int idProfessores;
  TurmasModel({
    this.idTurmas,
    required this.nomeTurma,
    required this.periodoLetivo,
    required this.idProfessores,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'idTurmas': idTurmas,
      'nomeTurma': nomeTurma,
      'periodoLetivo': periodoLetivo,
      'idProfessores': idProfessores,
    };
  }

  factory TurmasModel.fromMap(Map<String, dynamic> map) {
    return TurmasModel(
      idTurmas: map['idTurmas']?.toInt(),
      nomeTurma: map['nomeTurma'] ?? '',
      periodoLetivo: map['periodoLetivo'] ?? '',
      idProfessores: map['idProfessores']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TurmasModel.fromJson(String source) => TurmasModel.fromMap(json.decode(source));
}
