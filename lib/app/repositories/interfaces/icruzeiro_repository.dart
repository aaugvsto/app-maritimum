import 'package:app/app/models/cruzeiro_model.dart';

abstract class ICruzeiroRepository {
  Future<List<Cruzeiro>> getAll();
}
