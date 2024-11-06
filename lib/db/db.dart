import 'package:mysql1/mysql1.dart';

class Db{
  MySqlConnection? _connection;

  final ConnectionSettings _c = ConnectionSettings(
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    db: 'Prova'
  );

  Future<MySqlConnection?> connect() async{
    try {
      _connection = await MySqlConnection.connect(_c);
      print('Conexão concluida');
    } catch (e) {
      _connection = null;
      print('Conexão falhou');
    }finally{
      // ignore: control_flow_in_finally
      return _connection;
    }
  }

  Future<void> close() async{
    try {
      if (_connection != null) {
        await _connection!.close();
        print('conexão fechada');
      }
    } catch (e) {
      print('Falha ao fechar');
    }
  }
}