part of 'liked_bloc.dart';

@freezed
class LikedState with _$LikedState {
  const factory LikedState.likedinitial() = likedinitial;
  const factory LikedState.displayliked({required List<LikedSongModel>likedList}) = displayliked;

}
