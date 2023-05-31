// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLiked,
    required TResult Function(BuildContext context, int index) addOrdeleteLiked,
    required TResult Function(BuildContext context, int index) deleteLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLiked,
    TResult? Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult? Function(BuildContext context, int index)? deleteLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLiked,
    TResult Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult Function(BuildContext context, int index)? deleteLiked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchLiked value) fetchLiked,
    required TResult Function(addOrdeleteLiked value) addOrdeleteLiked,
    required TResult Function(deleteLiked value) deleteLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchLiked value)? fetchLiked,
    TResult? Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult? Function(deleteLiked value)? deleteLiked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchLiked value)? fetchLiked,
    TResult Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult Function(deleteLiked value)? deleteLiked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedEventCopyWith<$Res> {
  factory $LikedEventCopyWith(
          LikedEvent value, $Res Function(LikedEvent) then) =
      _$LikedEventCopyWithImpl<$Res, LikedEvent>;
}

/// @nodoc
class _$LikedEventCopyWithImpl<$Res, $Val extends LikedEvent>
    implements $LikedEventCopyWith<$Res> {
  _$LikedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$fetchLikedCopyWith<$Res> {
  factory _$$fetchLikedCopyWith(
          _$fetchLiked value, $Res Function(_$fetchLiked) then) =
      __$$fetchLikedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchLikedCopyWithImpl<$Res>
    extends _$LikedEventCopyWithImpl<$Res, _$fetchLiked>
    implements _$$fetchLikedCopyWith<$Res> {
  __$$fetchLikedCopyWithImpl(
      _$fetchLiked _value, $Res Function(_$fetchLiked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$fetchLiked implements fetchLiked {
  const _$fetchLiked();

  @override
  String toString() {
    return 'LikedEvent.fetchLiked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$fetchLiked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLiked,
    required TResult Function(BuildContext context, int index) addOrdeleteLiked,
    required TResult Function(BuildContext context, int index) deleteLiked,
  }) {
    return fetchLiked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLiked,
    TResult? Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult? Function(BuildContext context, int index)? deleteLiked,
  }) {
    return fetchLiked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLiked,
    TResult Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult Function(BuildContext context, int index)? deleteLiked,
    required TResult orElse(),
  }) {
    if (fetchLiked != null) {
      return fetchLiked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchLiked value) fetchLiked,
    required TResult Function(addOrdeleteLiked value) addOrdeleteLiked,
    required TResult Function(deleteLiked value) deleteLiked,
  }) {
    return fetchLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchLiked value)? fetchLiked,
    TResult? Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult? Function(deleteLiked value)? deleteLiked,
  }) {
    return fetchLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchLiked value)? fetchLiked,
    TResult Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult Function(deleteLiked value)? deleteLiked,
    required TResult orElse(),
  }) {
    if (fetchLiked != null) {
      return fetchLiked(this);
    }
    return orElse();
  }
}

abstract class fetchLiked implements LikedEvent {
  const factory fetchLiked() = _$fetchLiked;
}

/// @nodoc
abstract class _$$addOrdeleteLikedCopyWith<$Res> {
  factory _$$addOrdeleteLikedCopyWith(
          _$addOrdeleteLiked value, $Res Function(_$addOrdeleteLiked) then) =
      __$$addOrdeleteLikedCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int index});
}

/// @nodoc
class __$$addOrdeleteLikedCopyWithImpl<$Res>
    extends _$LikedEventCopyWithImpl<$Res, _$addOrdeleteLiked>
    implements _$$addOrdeleteLikedCopyWith<$Res> {
  __$$addOrdeleteLikedCopyWithImpl(
      _$addOrdeleteLiked _value, $Res Function(_$addOrdeleteLiked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? index = null,
  }) {
    return _then(_$addOrdeleteLiked(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$addOrdeleteLiked implements addOrdeleteLiked {
  const _$addOrdeleteLiked({required this.context, required this.index});

  @override
  final BuildContext context;
  @override
  final int index;

  @override
  String toString() {
    return 'LikedEvent.addOrdeleteLiked(context: $context, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addOrdeleteLiked &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addOrdeleteLikedCopyWith<_$addOrdeleteLiked> get copyWith =>
      __$$addOrdeleteLikedCopyWithImpl<_$addOrdeleteLiked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLiked,
    required TResult Function(BuildContext context, int index) addOrdeleteLiked,
    required TResult Function(BuildContext context, int index) deleteLiked,
  }) {
    return addOrdeleteLiked(context, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLiked,
    TResult? Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult? Function(BuildContext context, int index)? deleteLiked,
  }) {
    return addOrdeleteLiked?.call(context, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLiked,
    TResult Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult Function(BuildContext context, int index)? deleteLiked,
    required TResult orElse(),
  }) {
    if (addOrdeleteLiked != null) {
      return addOrdeleteLiked(context, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchLiked value) fetchLiked,
    required TResult Function(addOrdeleteLiked value) addOrdeleteLiked,
    required TResult Function(deleteLiked value) deleteLiked,
  }) {
    return addOrdeleteLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchLiked value)? fetchLiked,
    TResult? Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult? Function(deleteLiked value)? deleteLiked,
  }) {
    return addOrdeleteLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchLiked value)? fetchLiked,
    TResult Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult Function(deleteLiked value)? deleteLiked,
    required TResult orElse(),
  }) {
    if (addOrdeleteLiked != null) {
      return addOrdeleteLiked(this);
    }
    return orElse();
  }
}

abstract class addOrdeleteLiked implements LikedEvent {
  const factory addOrdeleteLiked(
      {required final BuildContext context,
      required final int index}) = _$addOrdeleteLiked;

  BuildContext get context;
  int get index;
  @JsonKey(ignore: true)
  _$$addOrdeleteLikedCopyWith<_$addOrdeleteLiked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteLikedCopyWith<$Res> {
  factory _$$deleteLikedCopyWith(
          _$deleteLiked value, $Res Function(_$deleteLiked) then) =
      __$$deleteLikedCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int index});
}

/// @nodoc
class __$$deleteLikedCopyWithImpl<$Res>
    extends _$LikedEventCopyWithImpl<$Res, _$deleteLiked>
    implements _$$deleteLikedCopyWith<$Res> {
  __$$deleteLikedCopyWithImpl(
      _$deleteLiked _value, $Res Function(_$deleteLiked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? index = null,
  }) {
    return _then(_$deleteLiked(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$deleteLiked implements deleteLiked {
  const _$deleteLiked({required this.context, required this.index});

  @override
  final BuildContext context;
  @override
  final int index;

  @override
  String toString() {
    return 'LikedEvent.deleteLiked(context: $context, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteLiked &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteLikedCopyWith<_$deleteLiked> get copyWith =>
      __$$deleteLikedCopyWithImpl<_$deleteLiked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLiked,
    required TResult Function(BuildContext context, int index) addOrdeleteLiked,
    required TResult Function(BuildContext context, int index) deleteLiked,
  }) {
    return deleteLiked(context, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLiked,
    TResult? Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult? Function(BuildContext context, int index)? deleteLiked,
  }) {
    return deleteLiked?.call(context, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLiked,
    TResult Function(BuildContext context, int index)? addOrdeleteLiked,
    TResult Function(BuildContext context, int index)? deleteLiked,
    required TResult orElse(),
  }) {
    if (deleteLiked != null) {
      return deleteLiked(context, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchLiked value) fetchLiked,
    required TResult Function(addOrdeleteLiked value) addOrdeleteLiked,
    required TResult Function(deleteLiked value) deleteLiked,
  }) {
    return deleteLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchLiked value)? fetchLiked,
    TResult? Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult? Function(deleteLiked value)? deleteLiked,
  }) {
    return deleteLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchLiked value)? fetchLiked,
    TResult Function(addOrdeleteLiked value)? addOrdeleteLiked,
    TResult Function(deleteLiked value)? deleteLiked,
    required TResult orElse(),
  }) {
    if (deleteLiked != null) {
      return deleteLiked(this);
    }
    return orElse();
  }
}

abstract class deleteLiked implements LikedEvent {
  const factory deleteLiked(
      {required final BuildContext context,
      required final int index}) = _$deleteLiked;

  BuildContext get context;
  int get index;
  @JsonKey(ignore: true)
  _$$deleteLikedCopyWith<_$deleteLiked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LikedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() likedinitial,
    required TResult Function(List<LikedSongModel> likedList) displayliked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? likedinitial,
    TResult? Function(List<LikedSongModel> likedList)? displayliked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? likedinitial,
    TResult Function(List<LikedSongModel> likedList)? displayliked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(likedinitial value) likedinitial,
    required TResult Function(displayliked value) displayliked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(likedinitial value)? likedinitial,
    TResult? Function(displayliked value)? displayliked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(likedinitial value)? likedinitial,
    TResult Function(displayliked value)? displayliked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedStateCopyWith<$Res> {
  factory $LikedStateCopyWith(
          LikedState value, $Res Function(LikedState) then) =
      _$LikedStateCopyWithImpl<$Res, LikedState>;
}

/// @nodoc
class _$LikedStateCopyWithImpl<$Res, $Val extends LikedState>
    implements $LikedStateCopyWith<$Res> {
  _$LikedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$likedinitialCopyWith<$Res> {
  factory _$$likedinitialCopyWith(
          _$likedinitial value, $Res Function(_$likedinitial) then) =
      __$$likedinitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$likedinitialCopyWithImpl<$Res>
    extends _$LikedStateCopyWithImpl<$Res, _$likedinitial>
    implements _$$likedinitialCopyWith<$Res> {
  __$$likedinitialCopyWithImpl(
      _$likedinitial _value, $Res Function(_$likedinitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$likedinitial implements likedinitial {
  const _$likedinitial();

  @override
  String toString() {
    return 'LikedState.likedinitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$likedinitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() likedinitial,
    required TResult Function(List<LikedSongModel> likedList) displayliked,
  }) {
    return likedinitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? likedinitial,
    TResult? Function(List<LikedSongModel> likedList)? displayliked,
  }) {
    return likedinitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? likedinitial,
    TResult Function(List<LikedSongModel> likedList)? displayliked,
    required TResult orElse(),
  }) {
    if (likedinitial != null) {
      return likedinitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(likedinitial value) likedinitial,
    required TResult Function(displayliked value) displayliked,
  }) {
    return likedinitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(likedinitial value)? likedinitial,
    TResult? Function(displayliked value)? displayliked,
  }) {
    return likedinitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(likedinitial value)? likedinitial,
    TResult Function(displayliked value)? displayliked,
    required TResult orElse(),
  }) {
    if (likedinitial != null) {
      return likedinitial(this);
    }
    return orElse();
  }
}

abstract class likedinitial implements LikedState {
  const factory likedinitial() = _$likedinitial;
}

/// @nodoc
abstract class _$$displaylikedCopyWith<$Res> {
  factory _$$displaylikedCopyWith(
          _$displayliked value, $Res Function(_$displayliked) then) =
      __$$displaylikedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LikedSongModel> likedList});
}

/// @nodoc
class __$$displaylikedCopyWithImpl<$Res>
    extends _$LikedStateCopyWithImpl<$Res, _$displayliked>
    implements _$$displaylikedCopyWith<$Res> {
  __$$displaylikedCopyWithImpl(
      _$displayliked _value, $Res Function(_$displayliked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedList = null,
  }) {
    return _then(_$displayliked(
      likedList: null == likedList
          ? _value._likedList
          : likedList // ignore: cast_nullable_to_non_nullable
              as List<LikedSongModel>,
    ));
  }
}

/// @nodoc

class _$displayliked implements displayliked {
  const _$displayliked({required final List<LikedSongModel> likedList})
      : _likedList = likedList;

  final List<LikedSongModel> _likedList;
  @override
  List<LikedSongModel> get likedList {
    if (_likedList is EqualUnmodifiableListView) return _likedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedList);
  }

  @override
  String toString() {
    return 'LikedState.displayliked(likedList: $likedList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$displayliked &&
            const DeepCollectionEquality()
                .equals(other._likedList, _likedList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_likedList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$displaylikedCopyWith<_$displayliked> get copyWith =>
      __$$displaylikedCopyWithImpl<_$displayliked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() likedinitial,
    required TResult Function(List<LikedSongModel> likedList) displayliked,
  }) {
    return displayliked(likedList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? likedinitial,
    TResult? Function(List<LikedSongModel> likedList)? displayliked,
  }) {
    return displayliked?.call(likedList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? likedinitial,
    TResult Function(List<LikedSongModel> likedList)? displayliked,
    required TResult orElse(),
  }) {
    if (displayliked != null) {
      return displayliked(likedList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(likedinitial value) likedinitial,
    required TResult Function(displayliked value) displayliked,
  }) {
    return displayliked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(likedinitial value)? likedinitial,
    TResult? Function(displayliked value)? displayliked,
  }) {
    return displayliked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(likedinitial value)? likedinitial,
    TResult Function(displayliked value)? displayliked,
    required TResult orElse(),
  }) {
    if (displayliked != null) {
      return displayliked(this);
    }
    return orElse();
  }
}

abstract class displayliked implements LikedState {
  const factory displayliked({required final List<LikedSongModel> likedList}) =
      _$displayliked;

  List<LikedSongModel> get likedList;
  @JsonKey(ignore: true)
  _$$displaylikedCopyWith<_$displayliked> get copyWith =>
      throw _privateConstructorUsedError;
}
