import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cartao {
  final String bandeira;
  final String? bandeiraPath;
  final String numero;
  final String cvv;
  final DateTime dtValidade;
  final String? apelido;
  final String nomeTitular;

  Cartao({
    required this.bandeira,
    required this.bandeiraPath,
    required this.numero,
    required this.cvv,
    required this.dtValidade,
    required this.apelido,
    required this.nomeTitular,
  });

  Cartao copyWith({
    String? bandeira,
    String? bandeiraPath,
    String? numero,
    String? cvv,
    DateTime? dtValidade,
    String? apelido,
    String? nomeTitular,
  }) {
    return Cartao(
      bandeira: bandeira ?? this.bandeira,
      bandeiraPath: bandeiraPath ?? this.bandeiraPath,
      numero: numero ?? this.numero,
      cvv: cvv ?? this.cvv,
      dtValidade: dtValidade ?? this.dtValidade,
      apelido: apelido ?? this.apelido,
      nomeTitular: nomeTitular ?? this.nomeTitular,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bandeira': bandeira,
      'bandeiraPath': bandeiraPath,
      'numero': numero,
      'cvv': cvv,
      'dtValidade': dtValidade.millisecondsSinceEpoch,
      'apelido': apelido,
      'nomeTitular': nomeTitular,
    };
  }

  factory Cartao.fromMap(Map<String, dynamic> map) {
    return Cartao(
      bandeira: map['bandeira'] as String,
      bandeiraPath: map['bandeiraPath'],
      numero: map['numero'] as String,
      cvv: map['cvv'] as String,
      dtValidade: DateTime.fromMillisecondsSinceEpoch(map['dtValidade'] as int),
      apelido: map['apelido'] != null ? map['apelido'] as String : null,
      nomeTitular: map['nomeTitular'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cartao.fromJson(String source) =>
      Cartao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cartao(bandeira: $bandeira, bandeiraPath: $bandeiraPath, numero: $numero, cvv: $cvv, dtValidade: $dtValidade, apelido: $apelido, nomeTitular: $nomeTitular)';
  }

  @override
  bool operator ==(covariant Cartao other) {
    if (identical(this, other)) return true;

    return other.bandeira == bandeira &&
        other.bandeiraPath == bandeiraPath &&
        other.numero == numero &&
        other.cvv == cvv &&
        other.dtValidade == dtValidade &&
        other.apelido == apelido &&
        other.nomeTitular == nomeTitular;
  }

  @override
  int get hashCode {
    return bandeira.hashCode ^
        bandeiraPath.hashCode ^
        numero.hashCode ^
        cvv.hashCode ^
        dtValidade.hashCode ^
        apelido.hashCode ^
        nomeTitular.hashCode;
  }
}
