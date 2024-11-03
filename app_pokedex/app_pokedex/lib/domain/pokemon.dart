import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required String nome,
    List<String>? tipo,
    required int hp,
    required int attack,
    required int defense,
    required int spAttack,
    required int spDefense,
    required int speed,
    required String url,
  }) = _Pokemon;
}