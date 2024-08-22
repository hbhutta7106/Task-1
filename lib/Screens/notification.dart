import 'package:api_project/Widgets/small_icon.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notifications = [
    'Gilbert you placed an order check your order history for full detail.',
    "Gilbert Thank You for shopping with us we cancelled order #254455",
    "Gilbert your order has been confirmed Please check the further detail ."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Color.fromRGBO(39, 39, 39, 1),
              fontSize: 16.0,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView.separated(
            itemBuilder: (context, index) => NotificationCard(
              notification: notifications[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final String notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromRGBO(244, 244, 244, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomContainer(
              func: () {},
              icon: Icons.notifications_active_outlined,
            ),
            const SizedBox(
              width: 5,
            ),
            notificationContainer(notification, context),
          ],
        ),
      ),
    );
  }
}

Widget notificationContainer(String message, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    padding: const EdgeInsets.all(5.0),
    child: Center(
      child: Text(
        message,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    ),
  );
}
