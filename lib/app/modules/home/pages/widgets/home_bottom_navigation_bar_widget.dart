import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/map_with_index.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/types/on_changed_type.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class HomeBottomNavigationBarWidget extends StatefulWidget {
  final OnChanged<int>? onChanged;

  final List<CustomBottomNavigationBarItem> items;

  const HomeBottomNavigationBarWidget({
    super.key,
    this.items = const [],
    this.onChanged,
  });

  @override
  State<HomeBottomNavigationBarWidget> createState() =>
      _HomeBottomNavigationBarWidgetState();
}

class _HomeBottomNavigationBarWidgetState
    extends State<HomeBottomNavigationBarWidget> {
  late CustomBottomNavigationBarItem currentTitle;

  @override
  void initState() {
    super.initState();

    currentTitle = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: size.width,
        height: 74,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: context.appTheme.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(
                20,
                90,
                108,
                234,
              ),
              blurRadius: 50,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.items
              .mapIndexed(
                (index, item) => Visibility(
                  visible: item.title == currentTitle.title,
                  replacement: Tooltip(
                    message: item.title,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          widget.onChanged?.call(index);
                          setState(() {
                            currentTitle = item;
                          });
                        },
                        child: Image.asset(
                          item.iconUrl,
                        ),
                      ),
                    ),
                  ),
                  child: Material(
                    type: MaterialType.button,
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              context.appTheme.darkGreen.withOpacity(.2),
                              context.appTheme.green.withOpacity(.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [
                              0.3,
                              0.8,
                            ],
                          ),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Image.asset(
                              item.iconUrl,
                            ),
                          ),
                          TextWidget.inter(
                            item.title,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final String title;
  final bool enabled;
  final String iconUrl;

  const CustomBottomNavigationBarItem({
    required this.iconUrl,
    required this.title,
    required this.enabled,
  });
}
