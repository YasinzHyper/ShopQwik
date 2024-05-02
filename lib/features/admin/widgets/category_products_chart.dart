import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<OrdinalData> dataList;
  const CategoryProductsChart({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      // aspectRatio: 18 / 9,
      padding: EdgeInsets.only(left: 36,),
      height: 350,
      width: double.infinity,
      child: DChartBarO(
        groupList: [
          OrdinalGroup(
            id: '1',
            data: dataList,
          )
        ],
        animate: true,

      ),
    );
  }
}
