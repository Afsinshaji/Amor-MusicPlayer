import 'package:amor_musics/DB/model/likedsongsmodel.dart';
import 'package:amor_musics/presentation/common_widgets&funs/add_to_likedsongs.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_event.dart';
part 'liked_state.dart';
part 'liked_bloc.freezed.dart';

class LikedBloc extends Bloc<LikedEvent, LikedState> {
  LikedBloc() : super(const likedinitial()) {
    on<fetchLiked>((event, emit) {
      List<LikedSongModel> likedList =
          LikedSongBox.getInstance().values.toList();
      emit(displayliked(likedList: likedList));
    });
    on<addOrdeleteLiked>((event, emit) {
      addtoliked(event.context, index: event.index);
      add(const fetchLiked());
    });
    on<deleteLiked>((event, emit) {
      // deletelikedsong(
      //   event.index,
      //   event.context,
      // );
      LikedSongBox.getInstance().deleteAt(event.index);
      add(const fetchLiked());
    });
  }
}
