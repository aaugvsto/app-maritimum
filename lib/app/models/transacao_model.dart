import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transacao {
  final int? id;
  final String? emailCliente;
  final String? numerosFinaisCartao;
  final String? tipoCartao;
  final int? numeroParcelas;
  final String? resultado;
  final double? valorTotal;

  Transacao({
    this.id,
    this.emailCliente,
    this.numerosFinaisCartao,
    this.tipoCartao,
    this.numeroParcelas,
    this.resultado,
    this.valorTotal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'emailCliente': emailCliente,
      'numerosFinaisCartao': numerosFinaisCartao,
      'tipoCartao': tipoCartao,
      'numeroParcelas': numeroParcelas,
      'resultado': resultado,
      'valorTotal': valorTotal,
    };
  }

  factory Transacao.fromMap(Map<String, dynamic> map) {
    return Transacao(
      id: map['id'] != null ? map['id'] as int : null,
      emailCliente:
          map['emailCliente'] != null ? map['emailCliente'] as String : null,
      numerosFinaisCartao: map['numerosFinaisCartao'] != null
          ? map['numerosFinaisCartao'] as String
          : null,
      tipoCartao:
          map['tipoCartao'] != null ? map['tipoCartao'] as String : null,
      numeroParcelas:
          map['numeroParcelas'] != null ? map['numeroParcelas'] as int : null,
      resultado: map['resultado'] != null ? map['resultado'] as String : null,
      valorTotal:
          map['valorTotal'] != null ? map['valorTotal'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transacao.fromJson(String source) =>
      Transacao.fromMap(json.decode(source) as Map<String, dynamic>);
}
