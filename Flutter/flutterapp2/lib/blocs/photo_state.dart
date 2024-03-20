
import 'package:flutterapp2/models/photo.dart';
enum PhotoStates {initial, loading, loaded, complete, error }

 class PhotoState {
    final PhotoStates _state;
    final List<Photo>? _photos;

    PhotoStates get currentState => _state;
    List<Photo>? get photos => _photos;
    
      PhotoState({required PhotoStates state, List<Photo> photos = const []})
      : _state = state,
        _photos = photos;

 }



