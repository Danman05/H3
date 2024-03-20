import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/blocs/photo_event.dart';
import 'package:flutterapp2/blocs/photo_state.dart';
import 'package:flutterapp2/service/locators/service_locator.dart';
import 'package:flutterapp2/service/photo_api.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoState(state: PhotoStates.initial)) {
    on<AddPhotoEvent>(_onAddImage);
    on<GetAllPhotoEvent>(_onGetAllImages);
  }

  void _onAddImage(AddPhotoEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoState(state: PhotoStates.loading));

    //fetch the random number for REST API
    final apiService = locator<PhotoService>(); //dependency injection
    try {
      await apiService.add(event.base64String);
      emit(PhotoState(state: PhotoStates.loaded));
      emit(PhotoState(state: PhotoStates.complete));
    } catch (e) {
      emit(PhotoState(state: PhotoStates.error));
    }
  }

  void _onGetAllImages(GetAllPhotoEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoState(state: PhotoStates.loading));

    final apiService = locator<PhotoService>();
    try {
      final images = await apiService.getAll();
      emit(PhotoState(state: PhotoStates.loaded));
      emit(PhotoState(state: PhotoStates.complete, photos: images));
    } catch (e) {
      emit(PhotoState(state: PhotoStates.error));
    }
  }
}
