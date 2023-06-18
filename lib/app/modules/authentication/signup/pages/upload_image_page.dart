import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/errors/app_exception.dart';
import 'package:foodninja/app/core/services/image/image_service.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/upload_image_controller.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/upload_image_state.dart';
import 'package:foodninja/app/modules/authentication/signup/widgets/payment_card_widget.dart';

import '../widgets/close_button_image_widget.dart';

class UploadImagePage extends StatefulWidget {
  final ImageService imageService;
  final UploadImageController uploadImageController;

  const UploadImagePage({
    super.key,
    required this.imageService,
    required this.uploadImageController,
  });

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: widget.uploadImageController,
          builder: (context, value, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Container(
                width: size.width,
                padding: padding.copyWith(
                  top: padding.top,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: -8,
                      child: Image.asset(
                        'assets/images/background_sliced.png',
                        width: size.width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 38.0,
                        left: 16,
                        right: 16,
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: size.height -
                              (padding.top + padding.bottom + 38.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  child: BackButtonWidget(),
                                ),
                                SizedBox(
                                  width: 264,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 19.0),
                                        child: TextWidget.inter(
                                          'Upload Your Photo Profile',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextWidget.inter(
                                        'This data will be displayed in your account profile for security',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Visibility(
                                    visible:
                                        value is UploadImageStatePickerImage,
                                    replacement: Center(
                                      child: SizedBox(
                                        width: 245,
                                        height: 238,
                                        child: Stack(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: value
                                                      is UploadImageStateImagePicked
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        15,
                                                      ),
                                                      child: SizedBox(
                                                        width: 245,
                                                        child: Image.file(
                                                          value.file,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            Positioned(
                                              top: 20,
                                              right: 10,
                                              child: CloseButtonImageWidget(
                                                onTap: widget
                                                    .uploadImageController
                                                    .removeImage,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 17.0,
                                          ),
                                          child: PaymentCardWidget(
                                            height: 129,
                                            onTap: () async {
                                              try {
                                                final image = await widget
                                                    .imageService
                                                    .pickerImageFromGallery();

                                                await widget
                                                    .uploadImageController
                                                    .loadImage(image);
                                                debugPrint(image.toString());
                                              } on AppException catch (error) {
                                                debugPrint(error.message);
                                              }
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 8.0,
                                                  ),
                                                  child: SvgPicture.asset(
                                                    'assets/images/gallery.svg',
                                                  ),
                                                ),
                                                TextWidget.inter(
                                                  'From Gallery',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 17.0),
                                          child: PaymentCardWidget(
                                              height: 129,
                                              onTap: () async {
                                                try {
                                                  final image = await widget
                                                      .imageService
                                                      .pickerImageFromCamera();
                                                  await widget
                                                      .uploadImageController
                                                      .loadImage(image);

                                                  debugPrint(image.toString());
                                                } on AppException catch (error) {
                                                  debugPrint(error.message);
                                                }
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 8.0,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/images/camera.svg',
                                                    ),
                                                  ),
                                                  TextWidget.inter(
                                                    'Take Photo',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 60.0,
                                  top: 24,
                                ),
                                child: ButtonWidget(
                                  text: 'Next',
                                  onPressed:
                                      value is UploadImageStateImagePicked
                                          ? () {
                                              Navigator.of(context).pushNamed(
                                                '/set-location',
                                              );
                                            }
                                          : null,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
