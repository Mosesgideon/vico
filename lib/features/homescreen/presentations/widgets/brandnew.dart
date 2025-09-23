import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/core/navigation/route_url.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../common/widgets/image_widget.dart';
import '../../../../common/widgets/text_view.dart';
import '../../../../core/theme/pallets.dart';
class Brandnew extends StatefulWidget {
  const Brandnew({super.key});

  @override
  State<Brandnew> createState() => _BrandnewState();
}

class _BrandnewState extends State<Brandnew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
        color: Color(0xfff18b01),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
              color:Color(0xff101828) ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "Welcome Back!",color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700,),
                  5.verticalSpace,
                  TextView(text: "Here's your financial overview",color: Colors.white,),
                  10.verticalSpace,
                  Container(
                    width: 1.sw,
                    padding:EdgeInsets.all(20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(text: "Total balance",color: Colors.white,),
                                TextView(text: "\$1,556",color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,),
                              ],
                            ),
                            CircleAvatar(radius: 25,child: Icon(Icons.trending_down_outlined,size: 25,),)
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                              child: TextView(text: "Quick Trade",color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w600,),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                              color: Colors.lightBlueAccent.withOpacity(0.2)),
                              child: TextView(text: "View Details",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600,),
                            )

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),
              ),
              color: Color(0xff101828)
            ),
            child: Column(
              children: List.generate(4, (context)=>Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1e2939),),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(text: "Total Assets",fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.6),),

                          TextView(text: "\$1,800",fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,)
                        ],
                      ),
                      CircleAvatar(radius: 25,
                        child: Icon(Icons.attach_money_outlined),)

                    ],
                  ),
                ),
              )),
            ),
          )
        ],
      ),
    );

  }
}
