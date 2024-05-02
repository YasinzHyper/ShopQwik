import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  // final AccountServices accountServices = AccountServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your Orders",
              onTap: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: "Log Out",
              onTap: () => AccountServices().logOut(context),
            ),
            AccountButton(
              text: "Your Wishlist",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
