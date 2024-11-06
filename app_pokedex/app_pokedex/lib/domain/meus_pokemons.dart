import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meus_pokemons.freezed.dart';

@freezed
class MeusPokemons with _$MeusPokemons {
  const factory MeusPokemons({
    required int id,
  }) = _MeusPokemons;
}
