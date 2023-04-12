// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cruzeiro {
  int id;
  String nomeExpedicao;
  String dataPartida;
  String dataChegada;
  String descricao;
  int navioId;
  double preco;
  bool userFavorited;

  Cruzeiro({
    required this.id,
    required this.nomeExpedicao,
    required this.dataPartida,
    required this.dataChegada,
    required this.descricao,
    required this.navioId,
    required this.preco,
    this.userFavorited = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nomeExpedicao': nomeExpedicao,
      'dataPartida': dataPartida.toString(),
      'dataChegada': dataChegada.toString(),
      'descricao': descricao,
      'navioId': navioId,
      'preco': preco,
      'userFavorited': userFavorited,
    };
  }

  factory Cruzeiro.fromMap(Map<String, dynamic> map) {
    return Cruzeiro(
      id: map['id'] as int,
      nomeExpedicao: map['nomeExpedicao'] as String,
      dataPartida: map['dataPartida'] as String,
      dataChegada: map['dataChegada'] as String,
      descricao: map['descricao'] as String,
      navioId: map['navioId'] as int,
      preco: double.parse(map['preco'].toString()),
      userFavorited: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cruzeiro.fromJson(String source) =>
      Cruzeiro.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cruzeiro(id: $id, nomeExpedicao: $nomeExpedicao, dataPartida: $dataPartida, dataChegada: $dataChegada, descricao: $descricao, navioId: $navioId, preco: $preco, userFavorited: $userFavorited)';
  }

  @override
  bool operator ==(covariant Cruzeiro other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nomeExpedicao == nomeExpedicao &&
        other.dataPartida == dataPartida &&
        other.dataChegada == dataChegada &&
        other.descricao == descricao &&
        other.navioId == navioId &&
        other.preco == preco &&
        other.userFavorited == userFavorited;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nomeExpedicao.hashCode ^
        dataPartida.hashCode ^
        dataChegada.hashCode ^
        descricao.hashCode ^
        navioId.hashCode ^
        preco.hashCode ^
        userFavorited.hashCode;
  }
}
