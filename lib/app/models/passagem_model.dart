import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Passagem {
  final int id;
  final int cruzeiroId;
  final String pessoaCompradoraEmail;
  final String? pessoaTitularEmail;
  final String? nomeTitularDaPassagem;
  final String? titularCPF;
  final String? numeroPassaporte;

  Passagem({
    required this.id,
    required this.cruzeiroId,
    required this.pessoaCompradoraEmail,
    this.pessoaTitularEmail,
    this.nomeTitularDaPassagem,
    this.titularCPF,
    this.numeroPassaporte,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cruzeiroId': cruzeiroId,
      'pessoaCompradoraEmail': pessoaCompradoraEmail,
      'pessoaTitularEmail': pessoaTitularEmail,
      'nomeTitularDaPassagem': nomeTitularDaPassagem,
      'titularCPF': titularCPF,
      'numeroPassaporte': numeroPassaporte,
    };
  }

  factory Passagem.fromMap(Map<String, dynamic> map) {
    return Passagem(
      id: map['id'] as int,
      cruzeiroId: map['cruzeiroId'] as int,
      pessoaCompradoraEmail: map['pessoaCompradoraEmail'] as String,
      pessoaTitularEmail: map['pessoaTitularEmail'] != null
          ? map['pessoaTitularEmail'] as String
          : null,
      nomeTitularDaPassagem: map['nomeTitularDaPassagem'] != null
          ? map['nomeTitularDaPassagem'] as String
          : null,
      titularCPF:
          map['titularCPF'] != null ? map['titularCPF'] as String : null,
      numeroPassaporte: map['numeroPassaporte'] != null
          ? map['numeroPassaporte'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Passagem.fromJson(String source) =>
      Passagem.fromMap(json.decode(source) as Map<String, dynamic>);
}
