part of 'liked_bloc.dart';

@freezed
class LikedEvent with _$LikedEvent {
  const factory LikedEvent.fetchLiked() = fetchLiked;
  const factory LikedEvent.addOrdeleteLiked({ required BuildContext context, required int index}) = addOrdeleteLiked;
   const factory LikedEvent.deleteLiked({required BuildContext context, required int index}) = deleteLiked;
}