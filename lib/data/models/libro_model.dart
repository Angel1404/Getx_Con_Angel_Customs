import 'dart:convert';

LibroModel libroModelFromMap(String str) => LibroModel.fromMap(json.decode(str));

String libroModelToMap(LibroModel data) => json.encode(data.toMap());

class LibroModel {
  LibroModel({
    this.id,
    this.tipo,
    this.autor,
    this.material,
    this.altura,
    this.peso,
    this.ancho,
    this.diametro,
    this.espesor,
    this.valorComercial,
    this.valorHistorico,
    this.descripcion,
    this.titulo,
    this.yearCreation,
    this.updatedAt,
  });

  int? id;
  String? tipo;
  String? autor;
  String? material;
  String? altura;
  double? peso;
  dynamic ancho;
  dynamic diametro;
  dynamic espesor;
  double? valorComercial;
  double? valorHistorico;
  String? descripcion;
  String? titulo;
  DateTime? yearCreation;
  DateTime? updatedAt;

  LibroModel copyWith({
    int? id,
    String? tipo,
    String? autor,
    String? material,
    String? altura,
    double? peso,
    dynamic ancho,
    dynamic diametro,
    dynamic espesor,
    double? valorComercial,
    double? valorHistorico,
    String? descripcion,
    String? titulo,
    DateTime? yearCreation,
    DateTime? updatedAt,
  }) =>
      LibroModel(
        id: id ?? this.id,
        tipo: tipo ?? this.tipo,
        autor: autor ?? this.autor,
        material: material ?? this.material,
        altura: altura ?? this.altura,
        peso: peso ?? this.peso,
        ancho: ancho ?? this.ancho,
        diametro: diametro ?? this.diametro,
        espesor: espesor ?? this.espesor,
        valorComercial: valorComercial ?? this.valorComercial,
        valorHistorico: valorHistorico ?? this.valorHistorico,
        descripcion: descripcion ?? this.descripcion,
        titulo: titulo ?? this.titulo,
        yearCreation: yearCreation ?? this.yearCreation,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory LibroModel.fromMap(Map<String, dynamic> json) => LibroModel(
        id: json["id"],
        tipo: json["tipo"],
        autor: json["autor"],
        material: json["material"],
        altura: json["altura"],
        peso: json["peso"],
        ancho: json["ancho"],
        diametro: json["diametro"],
        espesor: json["espesor"],
        valorComercial: json["valorComercial"],
        valorHistorico: json["valorHistorico"],
        descripcion: json["descripcion"],
        titulo: json["titulo"],
        yearCreation: json["yearCreation"] == null ? null : DateTime.parse(json["yearCreation"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "autor": autor,
        "material": material,
        "altura": altura,
        "peso": peso,
        "ancho": ancho,
        "diametro": diametro,
        "espesor": espesor,
        "valorComercial": valorComercial,
        "valorHistorico": valorHistorico,
        "descripcion": descripcion,
        "titulo": titulo,
        "yearCreation": yearCreation?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
