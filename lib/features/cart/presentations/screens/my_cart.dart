import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_button.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/error_widget.dart';
import 'package:vico/common/widgets/filled_textfield.dart';
import 'package:vico/common/widgets/image_widget.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/di/injector.dart';
import 'package:vico/core/navigation/route_url.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/theme/pallets.dart';
import 'package:vico/features/cart/data/data/cart_repo_impl.dart';
import 'package:vico/features/cart/data/models/update_payload.dart';
import 'package:vico/features/cart/presentations/cartbloc/cart_bloc.dart';
import 'package:vico/features/cart/presentations/screens/proceed_checkout.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/navigation/path_params.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff101828),
      appBar: CustomAppBar(
        bgColor:  Color(0xff101828),
        leading: SizedBox(),
        tittle: TextView(text: "Transactions",fontSize: 20,color: Colors.white,),

      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children:List.generate(6, (ctx)=>Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1e2939),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(text: "Purchased Itunes Card",color: Colors.white,fontSize: 16,),
                        5.verticalSpace,
                        Text("-₦399,600",style: TextStyle(color: Colors.red,fontSize: 15),),
                        5.verticalSpace,

                        Row(
                          children: [

                            TextView(text: "Sep 14, 2025, 05:31 AM",color: Colors.grey,fontSize: 12,),
                          10.horizontalSpace,
                            Container(padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                  color:Color(0xff1c2d52) ),
                            child: TextView(text: "Buy",color: Colors.white,),),
                            10.horizontalSpace,
                            Container(padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                  color:Color(0xff372f2a) ),
                              child: TextView(text: "Pending",color: Colors.yellowAccent,),),


                          ],
                        )
                      ],
                    )),
              )),

            ),
          ),
        ),



      ),
    );
  }


}
