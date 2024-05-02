import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(
        bottom: 10,
        right: 10,
        left: 10,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'hello ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
