import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitialState());

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> loadImage() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        emit(ErrorImageState(errorMsg: "Image not seleted!"));
      } else {
        emit(LoadImageState(imagePath: image.path));
      }
    } catch (errorMsg) {
      emit(ErrorImageState(errorMsg: errorMsg.toString()));
    }
  }

  void reset() {
    emit(ImagePickerInitialState());
  }
}
