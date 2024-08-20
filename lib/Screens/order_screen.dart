import 'package:api_project/Widgets/small_icon.dart';
import 'package:api_project/constants.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> categories = [
    'Processing',
    'Shipped',
    'Delivered',
    'Returned',
    'Cancel'
  ];
  List<String> orderNumbers = [
    'Order #21544',
    'Order #456789',
    'Order #123456'
  ];
  List<String> itemQuantity = ['2 items', '4 items', '6 items'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(
          "Orders",
          style: TextStyle(
              color: Color.fromRGBO(39, 39, 39, 1),
              fontSize: 18.0,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                height: 30,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryContainer(
                          ontap: () => _onTap(index),
                          category: categories[index],
                          selectedIndex: _selectedIndex,
                          currentIndex: index);
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: orderNumbers.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                          itemNumbers: itemQuantity[index],
                          orderNumber: orderNumbers[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key,
      required this.ontap,
      required this.category,
      required this.selectedIndex,
      required this.currentIndex});
  final VoidCallback ontap;
  final String category;
  final int selectedIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:
                selectedIndex == currentIndex ? Colors.blue : primaryTextColor),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              category,
              style: TextStyle(
                fontSize: 15,
                color: selectedIndex == currentIndex
                    ? Colors.white
                    : secondaryTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key, required this.itemNumbers, required this.orderNumber});

  final String itemNumbers, orderNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromRGBO(244, 244, 244, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              func: () {},
              icon: Icons.receipt_outlined,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: notificationContainer(orderNumber, itemNumbers)),
                  CustomContainer(
                    func: () {},
                    icon: Icons.arrow_forward_ios_rounded,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget notificationContainer(String message, String itemQuantity) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          message,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          itemQuantity,
          style: const TextStyle(color: Color.fromRGBO(39, 39, 39, 0.5)),
        )
      ],
    ),
  );
}
