import 'package:prova_worldskills/db/db.dart';
import 'package:prova_worldskills/models/professores_model.dart';

class ProfessoresServices {
  Db db = Db();
  
  Future<void> cadastrar(ProfessoresModel professor)async{
    final connection = await db.connect();
    String sql = 'INSERT INTO Professores (nomeProfessor, senhaProfessor) VALUES (?, ?);';
    await connection!.query(sql,[professor.nomeProfessor,professor.senhaProfessor]);
    await connection.close();
  }

  Future<List<ProfessoresModel>> getAll()async {
    final connection = await db.connect();
    String sql = 'Select * from Professores';
    final result = await connection!.query(sql);
    await connection.close();
    return result.map((professor)=> ProfessoresModel.fromMap(professor.fields)).toList();
  }

  Future<void> deleteById(int id)async{
    final connection = await db.connect();
    String sql = 'DELETE FROM professores WHERE idProfessores = ?;';
    await connection!.query(sql,[id]);
  }
  Future<bool> login(ProfessoresModel professor) async{
    final connection = await db.connect();
    String sql = 'Select * from professores where nomeProfessor = ? and senhaProfessor = ?';
    final result = await connection!.query(sql,[professor.nomeProfessor,professor.senhaProfessor]);
    connection.close();
    if (result.isEmpty) {
      return false;
    }else{
      return true;
    }
  }

  Future<void> recuperarSenha(Map<String, dynamic> dados) async{
    final connection = await db.connect();
    String sql = 'UPDATE professores SET senhaProfessor = ? WHERE nomeProfessor = ?;';
    await connection!.query(sql,[dados['novaSenha'],dados['nomeProfessor']]);
    connection.close();
  }

}