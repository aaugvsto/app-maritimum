import 'dart:convert';

import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/repositories/interfaces/icards_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CardRepository implements ICardRepository {
  @override
  Box box;

  CardRepository(this.box);

  @override
  Future<String?> findCardBrand(int cardNumber) async {
    String url = 'https://lookup.binlist.net/$cardNumber';

    var res = await http.get(Uri.parse(url));
    var decode = jsonDecode(res.body);

    String bandeira = decode['scheme'];
    var assetLogoPath = _getCardBrand(bandeira);

    return assetLogoPath;
  }

  String? _getCardBrand(String bandeira) {
    switch (bandeira) {
      case 'mastercard':
        return 'assets/logo/mastercard.svg';
      case 'maestro':
        return 'assets/logo/maestro.svg';
      case 'visa':
        return 'assets/logo/visa.svg';
      case 'elo':
        return 'assets/logo/elo.svg';
      case 'hiper':
        return 'assets/logo/hiper.svg';
      case 'hipercard':
        return 'assets/logo/hipercard.svg';
      case 'paypal':
        return 'assets/logo/paypal.svg';
      case 'discover':
        return 'assets/logo/discover.svg';
    }
    return null;
  }

  @override
  Future<List<Cartao>> findCardsCurrentUser() async {
    String email = await SharedPrefService.getCurrentUser();
    var cartoesBox = box.get(email);

    List cartoesFromJson = cartoesBox != null ? jsonDecode(cartoesBox) : [];

    List<Cartao> cartoes = [];

    for (var cartao in cartoesFromJson) {
      cartoes.add(Cartao.fromJson(cartao));
    }

    return cartoes;
  }

  @override
  Future<bool> createOrUpdate({
    required Cartao cartao,
    bool isUpdate = false,
  }) async {
    try {
      String email = await SharedPrefService.getCurrentUser();

      List<Cartao> cartoes = await findCardsCurrentUser();

      if (isUpdate) {
        cartoes.removeWhere((element) => element.numero == cartao.numero);
      }

      cartoes.add(cartao);

      await box.put(email, jsonEncode(cartoes));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> removeCard(String numeroCartao) async {
    try {
      List<Cartao> cartoes = await findCardsCurrentUser();
      String email = await SharedPrefService.getCurrentUser();

      cartoes.removeWhere((element) => element.numero == numeroCartao);

      await box.put(email, jsonEncode(cartoes));

      return true;
    } catch (e) {
      return false;
    }
  }
}
