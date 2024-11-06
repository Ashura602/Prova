import 'dart:convert';

import 'package:prova_worldskills/models/professores_model.dart';
import 'package:prova_worldskills/services/professores_services.dart';
import 'package:prova_worldskills/views/json_view.dart';
import 'package:shelf/shelf.dart';

class ProfessoresControllers {
  final ProfessoresServices profServices = ProfessoresServices();

  Future<Response> login(Request request) async{
    try {
      final loginProf =  await profServices.login(ProfessoresModel.fromJson(await request.readAsString()));
      return JsonView.render({'Login': loginProf});
    } catch (e) {
      return JsonView.renderError('Erro ao logar', e.toString());
    }
  }
  Future<Response> recuperarSenha(Request request) async{
    try {
      await profServices.recuperarSenha(jsonDecode(await request.readAsString()));
      return JsonView.render({'Message': 'Nova senha colocada com sucesso'});
    } catch (e) {
      return JsonView.renderError('Erro ao recuperar senha', e.toString());
    }
  }
  Future<Response> cadastrar(Request request) async{
    try {
      await profServices.cadastrar(ProfessoresModel.fromJson(await request.readAsString()));
      return JsonView.render({'message': 'Cadastro concluido'});
    } catch (e) {
      return JsonView.renderError('Erro ao cadastrar', e.toString());
    }
  }
  Future<Response> getAll(Request request) async{
    try {
      final professores  = await profServices.getAll();
      return JsonView.render({'Professores': professores.map((professor)=> professor.toMap()).toList()});
    } catch (e) {
      return JsonView.renderError('Erro ao buscar Professores', e.toString());
    }
  }
  Future<Response> deleteById(Request request, String id) async{
    try {
      await profServices.deleteById(int.parse(id));
      return JsonView.render({'message': 'Exclusão concluida com sucesso'});
    } catch (e) {
      return JsonView.renderError('Erro ao deletar', e.toString());
    }
  }
}