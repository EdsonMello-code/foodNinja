import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/services/snack_bar_service/snack_bar_service.dart';
import 'package:foodninja/app/core/utils/unit.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/set_location_controller.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/set_location_state.dart';
import 'package:foodninja/app/modules/authentication/signup/widgets/location_button_widget.dart';

class SetLocationPage extends StatefulWidget {
  final SetLocationController setLocationController;

  const SetLocationPage({
    super.key,
    required this.setLocationController,
  });

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  @override
  void initState() {
    super.initState();

    widget.setLocationController.addListener(setLocationListerner);
  }

  Unit setLocationListerner() {
    final state = widget.setLocationController.value;

    if (state is SetLocationStateAdded) {
      SnackBarService.showSuccess(
        context,
        'Localizacao salva!',
      );
    }

    if (state is SetLocationStateFailure) {
      SnackBarService.showFailure(
        context,
        'Falha ao salvar localizacao atual!',
      );
    }

    return unit;
  }

  @override
  void dispose() {
    super.dispose();
    widget.setLocationController.removeListener(setLocationListerner);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: SingleChildScrollView(
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
                    minHeight:
                        size.height - (padding.top + padding.bottom + 38.0),
                    maxWidth: size.width,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 19.0),
                                  child: TextWidget.inter(
                                    'Set Your Location',
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 40.0,
                                    bottom: 27,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 14.0),
                                        child: SvgPicture.asset(
                                          'assets/images/location.svg',
                                        ),
                                      ),
                                      TextWidget.inter(
                                        'Your Location',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LocationButtonWidget(
                            text: 'Set location',
                            onPressed: widget
                                .setLocationController.saveCurrentLocation,
                          )
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 60.0,
                            top: 24,
                          ),
                          child: ValueListenableBuilder(
                              valueListenable: widget.setLocationController,
                              builder: (context, value, child) {
                                return ButtonWidget(
                                  text: 'Next',
                                  onPressed: value is SetLocationStateAdded
                                      ? () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                            '/signup-success-notification',
                                          );
                                        }
                                      : null,
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
