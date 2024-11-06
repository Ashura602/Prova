import 'dart:convert';

class ProfessoresModel {
  int? idProfessores;
  String nomeProfessor;
  String senhaProfessor;
  String emailProfessor;
  
  ProfessoresModel({
    this.idProfessores,
    required this.nomeProfessor,
    required this.senhaProfessor,
    required this.emailProfessor,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProfessores': idProfessores,
      'nomeProfessor': nomeProfessor,
      'senhaProfessor': senhaProfessor,
      'emailProfessor': emailProfessor,
    };
  }

  factory ProfessoresModel.fromMap(Map<String, dynamic> map) {
    return ProfessoresModel(
      idProfessores: map['idProfessores']?.toInt(),
      nomeProfessor: map['nomeProfessor'] ?? '',
      senhaProfessor: map['senhaProfessor'] ?? '',
      emailProfessor: map['emailProfessor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessoresModel.fromJson(String source) => ProfessoresModel.fromMap(json.decode(source));

}
