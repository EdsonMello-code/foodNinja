import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/notifications/pages/widgets/notification_card_widget.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => Notificationstate();
}

class Notificationstate extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: padding.top,
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: size.height - padding.top,
            maxWidth: size.width,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage(
                'assets/images/background_sliced.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 38.0,
                  bottom: 19,
                ),
                child: BackButtonWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextWidget.inter(
                  'Notification',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const NotificationCardWidget(
                status: NoticationEnum.success,
                time: 'Recently',
                title: 'Your order has been taken by the driver',
              ),
              const NotificationCardWidget(
                status: NoticationEnum.payment,
                time: '10.00 Am',
                title: r'Topup for $100 was successful',
              ),
              const NotificationCardWidget(
                status: NoticationEnum.payment,
                time: '22 Juny 2021',
                title: 'Your order has been canceled',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
