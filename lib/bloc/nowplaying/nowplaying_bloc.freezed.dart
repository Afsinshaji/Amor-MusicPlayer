// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nowplaying_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NowplayingEvent {
  List<dynamic> get songlist => throw _privateConstructorUsedError;
  int get songindex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> songlist, int songindex) playSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> songlist, int songindex)? playSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> songlist, int songindex)? playSong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(playSong value) playSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(playSong value)? playSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(playSong value)? playSong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NowplayingEventCopyWith<NowplayingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NowplayingEventCopyWith<$Res> {
  factory $NowplayingEventCopyWith(
          NowplayingEvent value, $Res Function(NowplayingEvent) then) =
      _$NowplayingEventCopyWithImpl<$Res, NowplayingEvent>;
  @useResult
  $Res call({List<dynamic> songlist, int songindex});
}

/// @nodoc
class _$NowplayingEventCopyWithImpl<$Res, $Val extends NowplayingEvent>
    implements $NowplayingEventCopyWith<$Res> {
  _$NowplayingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
    Object? songindex = null,
  }) {
    return _then(_value.copyWith(
      songlist: null == songlist
          ? _value.songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      songindex: null == songindex
          ? _value.songindex
          : songindex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$playSongCopyWith<$Res>
    implements $NowplayingEventCopyWith<$Res> {
  factory _$$playSongCopyWith(
          _$playSong value, $Res Function(_$playSong) then) =
      __$$playSongCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> songlist, int songindex});
}

/// @nodoc
class __$$playSongCopyWithImpl<$Res>
    extends _$NowplayingEventCopyWithImpl<$Res, _$playSong>
    implements _$$playSongCopyWith<$Res> {
  __$$playSongCopyWithImpl(_$playSong _value, $Res Function(_$playSong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
    Object? songindex = null,
  }) {
    return _then(_$playSong(
      songlist: null == songlist
          ? _value._songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      songindex: null == songindex
          ? _value.songindex
          : songindex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$playSong implements playSong {
  const _$playSong(
      {required final List<dynamic> songlist, required this.songindex})
      : _songlist = songlist;

  final List<dynamic> _songlist;
  @override
  List<dynamic> get songlist {
    if (_songlist is EqualUnmodifiableListView) return _songlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songlist);
  }

  @override
  final int songindex;

  @override
  String toString() {
    return 'NowplayingEvent.playSong(songlist: $songlist, songindex: $songindex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$playSong &&
            const DeepCollectionEquality().equals(other._songlist, _songlist) &&
            (identical(other.songindex, songindex) ||
                other.songindex == songindex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songlist), songindex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$playSongCopyWith<_$playSong> get copyWith =>
      __$$playSongCopyWithImpl<_$playSong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> songlist, int songindex) playSong,
  }) {
    return playSong(songlist, songindex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> songlist, int songindex)? playSong,
  }) {
    return playSong?.call(songlist, songindex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> songlist, int songindex)? playSong,
    required TResult orElse(),
  }) {
    if (playSong != null) {
      return playSong(songlist, songindex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(playSong value) playSong,
  }) {
    return playSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(playSong value)? playSong,
  }) {
    return playSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(playSong value)? playSong,
    required TResult orElse(),
  }) {
    if (playSong != null) {
      return playSong(this);
    }
    return orElse();
  }
}

abstract class playSong implements NowplayingEvent {
  const factory playSong(
      {required final List<dynamic> songlist,
      required final int songindex}) = _$playSong;

  @override
  List<dynamic> get songlist;
  @override
  int get songindex;
  @override
  @JsonKey(ignore: true)
  _$$playSongCopyWith<_$playSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NowplayingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<dynamic> songlist, int songindex)
        nowPlayingSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<dynamic> songlist, int songindex)? nowPlayingSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<dynamic> songlist, int songindex)? nowPlayingSong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(nowplayinginitial value) initial,
    required TResult Function(nowPlayingSong value) nowPlayingSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(nowplayinginitial value)? initial,
    TResult? Function(nowPlayingSong value)? nowPlayingSong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(nowplayinginitial value)? initial,
    TResult Function(nowPlayingSong value)? nowPlayingSong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NowplayingStateCopyWith<$Res> {
  factory $NowplayingStateCopyWith(
          NowplayingState value, $Res Function(NowplayingState) then) =
      _$NowplayingStateCopyWithImpl<$Res, NowplayingState>;
}

/// @nodoc
class _$NowplayingStateCopyWithImpl<$Res, $Val extends NowplayingState>
    implements $NowplayingStateCopyWith<$Res> {
  _$NowplayingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$nowplayinginitialCopyWith<$Res> {
  factory _$$nowplayinginitialCopyWith(
          _$nowplayinginitial value, $Res Function(_$nowplayinginitial) then) =
      __$$nowplayinginitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$nowplayinginitialCopyWithImpl<$Res>
    extends _$NowplayingStateCopyWithImpl<$Res, _$nowplayinginitial>
    implements _$$nowplayinginitialCopyWith<$Res> {
  __$$nowplayinginitialCopyWithImpl(
      _$nowplayinginitial _value, $Res Function(_$nowplayinginitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$nowplayinginitial implements nowplayinginitial {
  const _$nowplayinginitial();

  @override
  String toString() {
    return 'NowplayingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$nowplayinginitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<dynamic> songlist, int songindex)
        nowPlayingSong,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<dynamic> songlist, int songindex)? nowPlayingSong,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<dynamic> songlist, int songindex)? nowPlayingSong,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(nowplayinginitial value) initial,
    required TResult Function(nowPlayingSong value) nowPlayingSong,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(nowplayinginitial value)? initial,
    TResult? Function(nowPlayingSong value)? nowPlayingSong,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(nowplayinginitial value)? initial,
    TResult Function(nowPlayingSong value)? nowPlayingSong,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class nowplayinginitial implements NowplayingState {
  const factory nowplayinginitial() = _$nowplayinginitial;
}

/// @nodoc
abstract class _$$nowPlayingSongCopyWith<$Res> {
  factory _$$nowPlayingSongCopyWith(
          _$nowPlayingSong value, $Res Function(_$nowPlayingSong) then) =
      __$$nowPlayingSongCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> songlist, int songindex});
}

/// @nodoc
class __$$nowPlayingSongCopyWithImpl<$Res>
    extends _$NowplayingStateCopyWithImpl<$Res, _$nowPlayingSong>
    implements _$$nowPlayingSongCopyWith<$Res> {
  __$$nowPlayingSongCopyWithImpl(
      _$nowPlayingSong _value, $Res Function(_$nowPlayingSong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
    Object? songindex = null,
  }) {
    return _then(_$nowPlayingSong(
      songlist: null == songlist
          ? _value._songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      songindex: null == songindex
          ? _value.songindex
          : songindex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$nowPlayingSong implements nowPlayingSong {
  const _$nowPlayingSong(
      {required final List<dynamic> songlist, required this.songindex})
      : _songlist = songlist;

  final List<dynamic> _songlist;
  @override
  List<dynamic> get songlist {
    if (_songlist is EqualUnmodifiableListView) return _songlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songlist);
  }

  @override
  final int songindex;

  @override
  String toString() {
    return 'NowplayingState.nowPlayingSong(songlist: $songlist, songindex: $songindex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$nowPlayingSong &&
            const DeepCollectionEquality().equals(other._songlist, _songlist) &&
            (identical(other.songindex, songindex) ||
                other.songindex == songindex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songlist), songindex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$nowPlayingSongCopyWith<_$nowPlayingSong> get copyWith =>
      __$$nowPlayingSongCopyWithImpl<_$nowPlayingSong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<dynamic> songlist, int songindex)
        nowPlayingSong,
  }) {
    return nowPlayingSong(songlist, songindex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<dynamic> songlist, int songindex)? nowPlayingSong,
  }) {
    return nowPlayingSong?.call(songlist, songindex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<dynamic> songlist, int songindex)? nowPlayingSong,
    required TResult orElse(),
  }) {
    if (nowPlayingSong != null) {
      return nowPlayingSong(songlist, songindex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(nowplayinginitial value) initial,
    required TResult Function(nowPlayingSong value) nowPlayingSong,
  }) {
    return nowPlayingSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(nowplayinginitial value)? initial,
    TResult? Function(nowPlayingSong value)? nowPlayingSong,
  }) {
    return nowPlayingSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(nowplayinginitial value)? initial,
    TResult Function(nowPlayingSong value)? nowPlayingSong,
    required TResult orElse(),
  }) {
    if (nowPlayingSong != null) {
      return nowPlayingSong(this);
    }
    return orElse();
  }
}

abstract class nowPlayingSong implements NowplayingState {
  const factory nowPlayingSong(
      {required final List<dynamic> songlist,
      required final int songindex}) = _$nowPlayingSong;

  List<dynamic> get songlist;
  int get songindex;
  @JsonKey(ignore: true)
  _$$nowPlayingSongCopyWith<_$nowPlayingSong> get copyWith =>
      throw _privateConstructorUsedError;
}
