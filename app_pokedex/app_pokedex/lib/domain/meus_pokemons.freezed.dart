// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meus_pokemons.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeusPokemons {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of MeusPokemons
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeusPokemonsCopyWith<MeusPokemons> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeusPokemonsCopyWith<$Res> {
  factory $MeusPokemonsCopyWith(
          MeusPokemons value, $Res Function(MeusPokemons) then) =
      _$MeusPokemonsCopyWithImpl<$Res, MeusPokemons>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$MeusPokemonsCopyWithImpl<$Res, $Val extends MeusPokemons>
    implements $MeusPokemonsCopyWith<$Res> {
  _$MeusPokemonsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeusPokemons
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeusPokemonsImplCopyWith<$Res>
    implements $MeusPokemonsCopyWith<$Res> {
  factory _$$MeusPokemonsImplCopyWith(
          _$MeusPokemonsImpl value, $Res Function(_$MeusPokemonsImpl) then) =
      __$$MeusPokemonsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$MeusPokemonsImplCopyWithImpl<$Res>
    extends _$MeusPokemonsCopyWithImpl<$Res, _$MeusPokemonsImpl>
    implements _$$MeusPokemonsImplCopyWith<$Res> {
  __$$MeusPokemonsImplCopyWithImpl(
      _$MeusPokemonsImpl _value, $Res Function(_$MeusPokemonsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeusPokemons
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MeusPokemonsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MeusPokemonsImpl implements _MeusPokemons {
  const _$MeusPokemonsImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'MeusPokemons(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeusPokemonsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MeusPokemons
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeusPokemonsImplCopyWith<_$MeusPokemonsImpl> get copyWith =>
      __$$MeusPokemonsImplCopyWithImpl<_$MeusPokemonsImpl>(this, _$identity);
}

abstract class _MeusPokemons implements MeusPokemons {
  const factory _MeusPokemons({required final int id}) = _$MeusPokemonsImpl;

  @override
  int get id;

  /// Create a copy of MeusPokemons
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeusPokemonsImplCopyWith<_$MeusPokemonsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
