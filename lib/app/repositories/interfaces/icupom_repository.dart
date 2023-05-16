import 'package:app/app/models/cupom_model.dart';

abstract class ICupomRepository {
  Future<Cupom?> findByCodigo(String codigo);
}
