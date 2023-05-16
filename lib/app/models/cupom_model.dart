// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cupom {
  final int idCupom;
  final String codigo;
  final double porcentagemDesconto;
  Cupom({
    required this.idCupom,
    required this.codigo,
    required this.porcentagemDesconto,
  });

  Cupom copyWith({
    int? idCupom,
    String? codigo,
    double? porcentagemDesconto,
  }) {
    return Cupom(
      idCupom: idCupom ?? this.idCupom,
      codigo: codigo ?? this.codigo,
      porcentagemDesconto: porcentagemDesconto ?? this.porcentagemDesconto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCupom': idCupom,
      'codigo': codigo,
      'porcentagemDesconto': porcentagemDesconto,
    };
  }

  factory Cupom.fromMap(Map<String, dynamic> map) {
    return Cupom(
      idCupom: map['idCupom'] as int,
      codigo: map['codigo'] as String,
      porcentagemDesconto: double.parse(map['porcentagemDesconto'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cupom.fromJson(String source) =>
      Cupom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Cupom(idCupom: $idCupom, codigo: $codigo, porcentagemDesconto: $porcentagemDesconto)';

  @override
  bool operator ==(covariant Cupom other) {
    if (identical(this, other)) return true;

    return other.idCupom == idCupom &&
        other.codigo == codigo &&
        other.porcentagemDesconto == porcentagemDesconto;
  }

  @override
  int get hashCode =>
      idCupom.hashCode ^ codigo.hashCode ^ porcentagemDesconto.hashCode;
}
