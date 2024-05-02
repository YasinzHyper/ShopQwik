import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/admin/widgets/category_products_chart.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  static const String routeName = '/admin/analytics';
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (earnings == null || totalSales == null)
        ? const Loader()
        : Column(
            children: [
              Text(
                '₹$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CategoryProductsChart(
                dataList: earnings!
                    .map(
                      (e) => OrdinalData(
                        domain: e.label,
                        measure: e.earning,
                      ),
                    )
                    .toList(),
              ),
            ],
          );
  }
}
