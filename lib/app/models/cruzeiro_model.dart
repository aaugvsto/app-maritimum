import 'dart:convert';

class Cruzeiro {
  int id;
  String nomeExpedicao;
  DateTime dataPartida;
  DateTime dataChegada;
  String descricao;
  int navioId;
  double preco;

  Cruzeiro({
    required this.id,
    required this.nomeExpedicao,
    required this.dataPartida,
    required this.dataChegada,
    required this.descricao,
    required this.navioId,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeExpedicao': nomeExpedicao,
      'dataPartida': dataPartida,
      'dataChegada': dataChegada,
      'descricao': descricao,
      'navioId': navioId,
      'preco': preco,
    };
  }

  factory Cruzeiro.fromMap(Map<String, dynamic> map) {
    return Cruzeiro(
      id: map['id'],
      nomeExpedicao: map['nomeExpedicao'],
      dataChegada: DateTime.parse(map['dataChegada'].toString()),
      dataPartida: DateTime.parse(map['dataPartida'].toString()),
      descricao: map['descricao'],
      navioId: map['navioId'],
      preco: double.parse(map['preco'].toString()),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Cruzeiro.fromJson(String source) =>
      Cruzeiro.fromMap(jsonDecode(source));
}
