import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vico/common/widgets/custom_appbar.dart';

import '../../../../common/widgets/text_view.dart';
import '../../../buy_sel/presentation/screens/buy_sell.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff101828),
      appBar: CustomAppBar(
        bgColor: Color(0xff0f172a),
        leading: SizedBox(),tittle: TextView(text: "Quick Actions",fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white,),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (ctx)=>BuySell()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Color(0xff1e2939),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money,size: 50,color: Colors.white,),
                    TextView(text: "Sell GiftCard",color: Colors.white,fontSize: 16,)
                  ],
                ),
              ),
            );
        }, ),
      ),

    );
  }

  }

//
// return Scaffold(
// body: Padding(
// padding: EdgeInsets.all(16),
// child:
// ),
// );
