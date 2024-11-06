import 'package:prova_worldskills/controllers/professores_controllers.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiRoutes {
  final ProfessoresControllers _profController = ProfessoresControllers();

  Router get router{
    final router = Router();

    router.get('/professores',_profController.getAll);

    router.post('/professores', _profController.cadastrar);
    router.post('/professores/<id>', _profController.deleteById);
    router.post('/professores/recuperarSenha', _profController.recuperarSenha);


    return router;
  }
}