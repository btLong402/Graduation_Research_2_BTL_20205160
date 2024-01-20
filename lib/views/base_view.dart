import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:drink_shop_flutter/controllers/auth/auth_controller.dart';
import 'package:drink_shop_flutter/controllers/order/order_controller.dart';
import 'package:drink_shop_flutter/views/cart/cart_view.dart';
import 'package:drink_shop_flutter/views/history%20order/history_view.dart';
import 'package:drink_shop_flutter/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final AuthController authController = Get.find();
  final OrderController orderController = Get.put(OrderController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeView(
        scaffoldKey: scaffoldKey,
      ),
      const HistoryView(),
      const CartView(),
    ];
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 45.0,
                    backgroundImage:
                        AssetImage('assets/images/user_profile.png'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(authController.user.value.userName!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 30.0))
                ],
              ),
            ),
            const ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
            ),
            const Divider(
              height: 0.2,
            ),
            const ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.account_circle),
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: const Text("Logout"),
              leading: const Icon(Icons.logout_rounded),
              onTap: () => authController.logout(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.history_outlined, title: 'History'),
          TabItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
        ],
        backgroundColor: const Color(0xFFEEDcC6),
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
      ),
      body: screens[index],
    ));
  }
}
