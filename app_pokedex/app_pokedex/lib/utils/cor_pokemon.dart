import 'dart:ui';

class CorPokemon {
  static Map<String, Color> pokemonTypeColors = const {
    "Normal": Color(0xFFA8A77A),
    "Fire": Color(0xFFEE8130),
    "Water": Color(0xFF6390F0),
    "Electric": Color(0xFFF7D02C),
    "Grass": Color(0xFF7AC74C),
    "Ice": Color(0xFF96D9D6),
    "Fighting": Color(0xFFC22E28),
    "Poison": Color(0xFFA33EA1),
    "Ground": Color(0xFFE2BF65),
    "Flying": Color(0xFFA98FF3),
    "Psychic": Color(0xFFF95587),
    "Bug": Color(0xFFA6B91A),
    "Rock": Color(0xFFB6A136),
    "Ghost": Color(0xFF735797),
    "Dragon": Color(0xFF6F35FC),
    "Dark": Color(0xFF705746),
    "Steel": Color(0xFFB7B7CE),
    "Fairy": Color(0xFFD685AD),
  };

  static Color? getTypeColor(String type) {
    return pokemonTypeColors[type];
  }
}
