import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('subscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              textDirection: TextDirection.rtl,
              'اعتبار عضویت ویژه شما به پایان رسیده است',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  const Text(
                    textDirection: TextDirection.rtl,
                    'اشتراک یک ماهه',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text(
                      textDirection: TextDirection.rtl,
                      '29 هزار تومان',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
