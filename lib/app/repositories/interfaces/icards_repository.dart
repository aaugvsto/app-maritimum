import 'package:app/app/models/cartao_model.dart';
import 'package:hive/hive.dart';

abstract class ICardRepository {
  Box box;

  ICardRepository(this.box);

  Future<String?> findCardBrand(int cardNumber);
  Future<List<Cartao>> findCardsCurrentUser();
  Future<bool> createOrUpdate({
    required Cartao cartao,
    bool isUpdate = false,
  });
  Future<bool> removeCard(String numeroCartao);
}
