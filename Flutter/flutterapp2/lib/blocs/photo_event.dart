abstract class PhotoEvent {}

class AddPhotoEvent implements PhotoEvent {
  final String base64String;
  AddPhotoEvent(this.base64String);
}

class GetAllPhotoEvent implements PhotoEvent {}