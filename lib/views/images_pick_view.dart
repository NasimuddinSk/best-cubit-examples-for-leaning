import 'dart:io';

import 'package:filter_listview_cubit/cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesPickView extends StatelessWidget {
  const ImagesPickView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: Center(
        child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
          builder: (context, state) {
            return state is ImagePickerInitialState
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImagePickerCubit>().loadImage();
                      },
                      child: Text("Pick Image"),
                    ),
                  ],
                )
                : state is LoadImageState
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(File(state.imagePath), height: 200, width: 200),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImagePickerCubit>().reset();
                      },
                      child: Text("Pick Anothor Image"),
                    ),
                  ],
                )
                : state is ErrorImageState
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorMsg),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImagePickerCubit>().loadImage();
                      },
                      child: Text("Try Again"),
                    ),
                  ],
                )
                : SizedBox();
          },
        ),
      ),
    );
  }
}
