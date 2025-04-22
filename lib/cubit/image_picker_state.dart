part of 'image_picker_cubit.dart';

sealed class ImagePickerState {}

final class ImagePickerInitialState extends ImagePickerState {}

final class LoadImageState extends ImagePickerState {
  final String imagePath;

  LoadImageState({required this.imagePath});
}

final class ErrorImageState extends ImagePickerState {
  final String errorMsg;

  ErrorImageState({required this.errorMsg});
}
