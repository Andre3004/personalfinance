import 'package:json_annotation/json_annotation.dart';
part 'movel.g.dart';

@JsonSerializable()
class Movel {
  final String titulo;
  final double preco;
  final String foto;
  final String descricao;
  int quantidade = 0;

  Movel(this.titulo, this.preco, this.foto, this.descricao, {this.quantidade});

  static Movel fromJson(Map<String, dynamic> json) => _$MovelFromJson(json);
  Map<String, dynamic> toJson() => _$MovelToJson(this);

  @override
  String toString() {
    return 'Moveis{titulo: $titulo, preco: $preco, foto: $foto, descricao: $descricao}';
  }
}
