import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';

class SequenceInputsWidget extends StatefulWidget {
  const SequenceInputsWidget({super.key});

  @override
  State<SequenceInputsWidget> createState() => _SequenceInputsWidgetState();
}

class _SequenceInputsWidgetState extends State<SequenceInputsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: themeData.brightness == Brightness.light
            ? const [
                BoxShadow(
                  color: Color.fromARGB(
                    20,
                    90,
                    108,
                    234,
                  ),
                  blurRadius: 50,
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              height: 107,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 33),
              boxShadow: const [],
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputType: TextInputType.number,
              maxLength: 1,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(22),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Expanded(
            child: TextFieldWidget(
              height: 107,
              textAlign: TextAlign.center,
              maxLength: 1,
              boxShadow: const [],
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputType: TextInputType.number,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              style: const TextStyle(fontSize: 33),
            ),
          ),
          Expanded(
            child: TextFieldWidget(
              height: 107,
              textAlign: TextAlign.center,
              textInputType: TextInputType.number,
              boxShadow: const [],
              maxLength: 1,
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              style: const TextStyle(fontSize: 33),
            ),
          ),
          Expanded(
            child: TextFieldWidget(
              height: 107,
              textAlign: TextAlign.center,
              textInputType: TextInputType.number,
              boxShadow: const [],
              maxLength: 1,
              textInputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 33),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(22),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
