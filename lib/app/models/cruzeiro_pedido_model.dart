import 'dart:convert';

class CruzeiroPedido {
  int idCruzeiro;
  String nomeExpedicao;
  int quantidade;
  double valorUnitario;
  double valorTotal;

  CruzeiroPedido({
    required this.idCruzeiro,
    required this.nomeExpedicao,
    required this.quantidade,
    required this.valorUnitario,
    required this.valorTotal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCruzeiro': idCruzeiro,
      'nomeExpedicao': nomeExpedicao,
      'quantidade': quantidade,
      'valorUnitario': valorUnitario,
      'valorTotal': valorTotal,
    };
  }

  factory CruzeiroPedido.fromMap(Map<String, dynamic> map) {
    return CruzeiroPedido(
      idCruzeiro: map['idCruzeiro'] as int,
      nomeExpedicao: map['nomeExpedicao'] as String,
      quantidade: map['quantidade'] as int,
      valorUnitario: map['valorUnitario'] as double,
      valorTotal: map['valorTotal'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CruzeiroPedido.fromJson(String source) =>
      CruzeiroPedido.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CruzeiroPedido(idCruzeiro: $idCruzeiro, nomeExpedicao: $nomeExpedicao, quantidade: $quantidade, valorUnitario: $valorUnitario, valorTotal: $valorTotal)';
  }
}
