// ignore_for_file: empty_constructor_bodies

import 'dart:convert';

class Personagem{
  final String title;
  final String synopsis;
  final String images;

  const Personagem({
    required this.title,
    required this.synopsis,
    required this.images,
});

  factory Personagem.fromJson(Map<String, dynamic> json){
      return Personagem(
        title: json['title'],
        synopsis: json['synopsis'],
        images: json['images']['jpg']['small_image_url'],
      );
  }


}