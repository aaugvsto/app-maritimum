// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pessoa {
  int? id;
  String? nome;
  String? email;
  int? idade;
  int? sexoPessoaId;
  String? documento;
  String? senha;

  Pessoa({
    this.id,
    this.nome,
    this.email,
    this.idade,
    this.sexoPessoaId,
    this.documento,
    this.senha,
  });

  Pessoa copyWith({
    int? id,
    String? nome,
    String? email,
    int? idade,
    int? sexoPessoaId,
    String? documento,
    String? senha,
  }) {
    return Pessoa(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      idade: idade ?? this.idade,
      sexoPessoaId: sexoPessoaId ?? this.sexoPessoaId,
      documento: documento ?? this.documento,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'idade': idade,
      'sexoPessoaId': sexoPessoaId,
      'documento': documento,
      'senha': senha,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      idade: map['idade'] != null ? map['idade'] as int : null,
      sexoPessoaId:
          map['sexoPessoaId'] != null ? map['sexoPessoaId'] as int : null,
      documento: map['documento'] != null ? map['documento'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pessoa.fromJson(String source) =>
      Pessoa.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pessoa(id: $id, nome: $nome, email: $email, idade: $idade, sexoPessoaId: $sexoPessoaId, documento: $documento, senha: $senha)';
  }

  @override
  bool operator ==(covariant Pessoa other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.idade == idade &&
        other.sexoPessoaId == sexoPessoaId &&
        other.documento == documento &&
        other.senha == senha;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        email.hashCode ^
        idade.hashCode ^
        sexoPessoaId.hashCode ^
        documento.hashCode ^
        senha.hashCode;
  }
}
