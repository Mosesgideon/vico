import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/features/homescreen/presentations/widgets/brandnew.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        bgColor: Color(0xff0f172a),
        leading: CircleAvatar(),
        tittle: TextView(text: "Vico Exchange",fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600,),
        actions: [
          Icon(Iconsax.moon),
          10.horizontalSpace,
          Icon(Iconsax.notification),
          10.horizontalSpace,


        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Brandnew(),
            20.verticalSpace,


          ],
        ),
      )
    );
  }





}

class StockIndicator extends StatelessWidget {
  final int stockQuantity;

  const StockIndicator({super.key, required this.stockQuantity});

  @override
  Widget build(BuildContext context) {
    final double stockPercentage = (stockQuantity / 20 * 100).clamp(0, 100);
    final String stockMessage = _getStockMessage(stockQuantity);
    final Color stockLevelColor = _getStockLevelColor(stockQuantity);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stock text info
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stockMessage,
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              ),
              Text(
                '${stockQuantity} avail.',
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        // Progress bar
        Container(
          width: double.infinity,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * (stockPercentage / 100),
                    decoration: BoxDecoration(
                      color: stockLevelColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getStockMessage(int quantity) {
    if (quantity >= 15) return 'In Stock';
    if (quantity >= 5) return 'Low Stock';
    if (quantity >= 1) return 'Very Low Stock';
    return 'Out of Stock';
  }

  Color _getStockLevelColor(int quantity) {
    if (quantity >= 15) return Colors.green;
    if (quantity >= 5) return Colors.orange;
    if (quantity >= 1) return Colors.red;
    return Colors.grey;
  }
}


