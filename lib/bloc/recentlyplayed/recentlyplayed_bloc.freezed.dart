// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recentlyplayed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentlyplayedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecent,
    required TResult Function(int index, List<dynamic> allsongs) addToRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecent,
    TResult? Function(int index, List<dynamic> allsongs)? addToRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecent,
    TResult Function(int index, List<dynamic> allsongs)? addToRecent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchRecent value) fetchRecent,
    required TResult Function(addToRecent value) addToRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchRecent value)? fetchRecent,
    TResult? Function(addToRecent value)? addToRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchRecent value)? fetchRecent,
    TResult Function(addToRecent value)? addToRecent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyplayedEventCopyWith<$Res> {
  factory $RecentlyplayedEventCopyWith(
          RecentlyplayedEvent value, $Res Function(RecentlyplayedEvent) then) =
      _$RecentlyplayedEventCopyWithImpl<$Res, RecentlyplayedEvent>;
}

/// @nodoc
class _$RecentlyplayedEventCopyWithImpl<$Res, $Val extends RecentlyplayedEvent>
    implements $RecentlyplayedEventCopyWith<$Res> {
  _$RecentlyplayedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$fetchRecentCopyWith<$Res> {
  factory _$$fetchRecentCopyWith(
          _$fetchRecent value, $Res Function(_$fetchRecent) then) =
      __$$fetchRecentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchRecentCopyWithImpl<$Res>
    extends _$RecentlyplayedEventCopyWithImpl<$Res, _$fetchRecent>
    implements _$$fetchRecentCopyWith<$Res> {
  __$$fetchRecentCopyWithImpl(
      _$fetchRecent _value, $Res Function(_$fetchRecent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$fetchRecent implements fetchRecent {
  const _$fetchRecent();

  @override
  String toString() {
    return 'RecentlyplayedEvent.fetchRecent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$fetchRecent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecent,
    required TResult Function(int index, List<dynamic> allsongs) addToRecent,
  }) {
    return fetchRecent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecent,
    TResult? Function(int index, List<dynamic> allsongs)? addToRecent,
  }) {
    return fetchRecent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecent,
    TResult Function(int index, List<dynamic> allsongs)? addToRecent,
    required TResult orElse(),
  }) {
    if (fetchRecent != null) {
      return fetchRecent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchRecent value) fetchRecent,
    required TResult Function(addToRecent value) addToRecent,
  }) {
    return fetchRecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchRecent value)? fetchRecent,
    TResult? Function(addToRecent value)? addToRecent,
  }) {
    return fetchRecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchRecent value)? fetchRecent,
    TResult Function(addToRecent value)? addToRecent,
    required TResult orElse(),
  }) {
    if (fetchRecent != null) {
      return fetchRecent(this);
    }
    return orElse();
  }
}

abstract class fetchRecent implements RecentlyplayedEvent {
  const factory fetchRecent() = _$fetchRecent;
}

/// @nodoc
abstract class _$$addToRecentCopyWith<$Res> {
  factory _$$addToRecentCopyWith(
          _$addToRecent value, $Res Function(_$addToRecent) then) =
      __$$addToRecentCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, List<dynamic> allsongs});
}

/// @nodoc
class __$$addToRecentCopyWithImpl<$Res>
    extends _$RecentlyplayedEventCopyWithImpl<$Res, _$addToRecent>
    implements _$$addToRecentCopyWith<$Res> {
  __$$addToRecentCopyWithImpl(
      _$addToRecent _value, $Res Function(_$addToRecent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? allsongs = null,
  }) {
    return _then(_$addToRecent(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == allsongs
          ? _value._allsongs
          : allsongs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$addToRecent implements addToRecent {
  const _$addToRecent(this.index, final List<dynamic> allsongs)
      : _allsongs = allsongs;

  @override
  final int index;
  final List<dynamic> _allsongs;
  @override
  List<dynamic> get allsongs {
    if (_allsongs is EqualUnmodifiableListView) return _allsongs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allsongs);
  }

  @override
  String toString() {
    return 'RecentlyplayedEvent.addToRecent(index: $index, allsongs: $allsongs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addToRecent &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._allsongs, _allsongs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, index, const DeepCollectionEquality().hash(_allsongs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addToRecentCopyWith<_$addToRecent> get copyWith =>
      __$$addToRecentCopyWithImpl<_$addToRecent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecent,
    required TResult Function(int index, List<dynamic> allsongs) addToRecent,
  }) {
    return addToRecent(index, allsongs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecent,
    TResult? Function(int index, List<dynamic> allsongs)? addToRecent,
  }) {
    return addToRecent?.call(index, allsongs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecent,
    TResult Function(int index, List<dynamic> allsongs)? addToRecent,
    required TResult orElse(),
  }) {
    if (addToRecent != null) {
      return addToRecent(index, allsongs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchRecent value) fetchRecent,
    required TResult Function(addToRecent value) addToRecent,
  }) {
    return addToRecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchRecent value)? fetchRecent,
    TResult? Function(addToRecent value)? addToRecent,
  }) {
    return addToRecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchRecent value)? fetchRecent,
    TResult Function(addToRecent value)? addToRecent,
    required TResult orElse(),
  }) {
    if (addToRecent != null) {
      return addToRecent(this);
    }
    return orElse();
  }
}

abstract class addToRecent implements RecentlyplayedEvent {
  const factory addToRecent(final int index, final List<dynamic> allsongs) =
      _$addToRecent;

  int get index;
  List<dynamic> get allsongs;
  @JsonKey(ignore: true)
  _$$addToRecentCopyWith<_$addToRecent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecentlyplayedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recentinitial,
    required TResult Function(List<RecentlyPlayedSongModel> recentList)
        displayRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recentinitial,
    TResult? Function(List<RecentlyPlayedSongModel> recentList)? displayRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recentinitial,
    TResult Function(List<RecentlyPlayedSongModel> recentList)? displayRecent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(recentinitial value) recentinitial,
    required TResult Function(displayRecent value) displayRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(recentinitial value)? recentinitial,
    TResult? Function(displayRecent value)? displayRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(recentinitial value)? recentinitial,
    TResult Function(displayRecent value)? displayRecent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyplayedStateCopyWith<$Res> {
  factory $RecentlyplayedStateCopyWith(
          RecentlyplayedState value, $Res Function(RecentlyplayedState) then) =
      _$RecentlyplayedStateCopyWithImpl<$Res, RecentlyplayedState>;
}

/// @nodoc
class _$RecentlyplayedStateCopyWithImpl<$Res, $Val extends RecentlyplayedState>
    implements $RecentlyplayedStateCopyWith<$Res> {
  _$RecentlyplayedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$recentinitialCopyWith<$Res> {
  factory _$$recentinitialCopyWith(
          _$recentinitial value, $Res Function(_$recentinitial) then) =
      __$$recentinitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$recentinitialCopyWithImpl<$Res>
    extends _$RecentlyplayedStateCopyWithImpl<$Res, _$recentinitial>
    implements _$$recentinitialCopyWith<$Res> {
  __$$recentinitialCopyWithImpl(
      _$recentinitial _value, $Res Function(_$recentinitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$recentinitial implements recentinitial {
  const _$recentinitial();

  @override
  String toString() {
    return 'RecentlyplayedState.recentinitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$recentinitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recentinitial,
    required TResult Function(List<RecentlyPlayedSongModel> recentList)
        displayRecent,
  }) {
    return recentinitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recentinitial,
    TResult? Function(List<RecentlyPlayedSongModel> recentList)? displayRecent,
  }) {
    return recentinitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recentinitial,
    TResult Function(List<RecentlyPlayedSongModel> recentList)? displayRecent,
    required TResult orElse(),
  }) {
    if (recentinitial != null) {
      return recentinitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(recentinitial value) recentinitial,
    required TResult Function(displayRecent value) displayRecent,
  }) {
    return recentinitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(recentinitial value)? recentinitial,
    TResult? Function(displayRecent value)? displayRecent,
  }) {
    return recentinitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(recentinitial value)? recentinitial,
    TResult Function(displayRecent value)? displayRecent,
    required TResult orElse(),
  }) {
    if (recentinitial != null) {
      return recentinitial(this);
    }
    return orElse();
  }
}

abstract class recentinitial implements RecentlyplayedState {
  const factory recentinitial() = _$recentinitial;
}

/// @nodoc
abstract class _$$displayRecentCopyWith<$Res> {
  factory _$$displayRecentCopyWith(
          _$displayRecent value, $Res Function(_$displayRecent) then) =
      __$$displayRecentCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RecentlyPlayedSongModel> recentList});
}

/// @nodoc
class __$$displayRecentCopyWithImpl<$Res>
    extends _$RecentlyplayedStateCopyWithImpl<$Res, _$displayRecent>
    implements _$$displayRecentCopyWith<$Res> {
  __$$displayRecentCopyWithImpl(
      _$displayRecent _value, $Res Function(_$displayRecent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentList = null,
  }) {
    return _then(_$displayRecent(
      recentList: null == recentList
          ? _value._recentList
          : recentList // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayedSongModel>,
    ));
  }
}

/// @nodoc

class _$displayRecent implements displayRecent {
  const _$displayRecent(
      {required final List<RecentlyPlayedSongModel> recentList})
      : _recentList = recentList;

  final List<RecentlyPlayedSongModel> _recentList;
  @override
  List<RecentlyPlayedSongModel> get recentList {
    if (_recentList is EqualUnmodifiableListView) return _recentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentList);
  }

  @override
  String toString() {
    return 'RecentlyplayedState.displayRecent(recentList: $recentList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$displayRecent &&
            const DeepCollectionEquality()
                .equals(other._recentList, _recentList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recentList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$displayRecentCopyWith<_$displayRecent> get copyWith =>
      __$$displayRecentCopyWithImpl<_$displayRecent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recentinitial,
    required TResult Function(List<RecentlyPlayedSongModel> recentList)
        displayRecent,
  }) {
    return displayRecent(recentList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recentinitial,
    TResult? Function(List<RecentlyPlayedSongModel> recentList)? displayRecent,
  }) {
    return displayRecent?.call(recentList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recentinitial,
    TResult Function(List<RecentlyPlayedSongModel> recentList)? displayRecent,
    required TResult orElse(),
  }) {
    if (displayRecent != null) {
      return displayRecent(recentList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(recentinitial value) recentinitial,
    required TResult Function(displayRecent value) displayRecent,
  }) {
    return displayRecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(recentinitial value)? recentinitial,
    TResult? Function(displayRecent value)? displayRecent,
  }) {
    return displayRecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(recentinitial value)? recentinitial,
    TResult Function(displayRecent value)? displayRecent,
    required TResult orElse(),
  }) {
    if (displayRecent != null) {
      return displayRecent(this);
    }
    return orElse();
  }
}

abstract class displayRecent implements RecentlyplayedState {
  const factory displayRecent(
          {required final List<RecentlyPlayedSongModel> recentList}) =
      _$displayRecent;

  List<RecentlyPlayedSongModel> get recentList;
  @JsonKey(ignore: true)
  _$$displayRecentCopyWith<_$displayRecent> get copyWith =>
      throw _privateConstructorUsedError;
}
