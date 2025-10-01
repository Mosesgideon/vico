import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/error_widget.dart';
import 'package:vico/common/widgets/image_widget.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/di/injector.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/features/buy_sel/data/data/buy_sell_repo_impl.dart';
import 'package:vico/features/buy_sel/domain/buy_sell_repo.dart';
import 'package:vico/features/buy_sel/presentation/bloc/buy_and_sell_bloc.dart';
import 'package:vico/features/buy_sel/presentation/screens/sellcard_screen.dart';

import 'buycard_screen.dart';

class BuySell extends StatefulWidget {
  final String text;
  const BuySell({super.key, required this.text});

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {

  final buysellcard=BuyAndSellBloc(BuyAndSellRepositoryImpl(NetworkService()));
  @override
  void initState() {
    // TODO: implement initState
    buysellcard.add(GetAllCardsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        fgColor: Colors.white,
        bgColor: Color(0xff101828),
        tittle: TextView(
          text: widget.text,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color(0xff101828),
      body: BlocConsumer<BuyAndSellBloc, BuyAndSellState>(
        bloc: buysellcard,
  listener: _listenToBuySellState,
  builder: (context, state) {
    if(state is BuyAnSellfailiureState){

      return Center(
        child: AppPromptWidget(),
      );

    }
    if(state is GetAllCardsSuccessState){
      logger.w(state.response.data);
      final resp=state.response.data?.cards;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(

          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff1e2939),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView(
                text: "Select Cryptocurrency",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              TextView(
                text: "Select a cryptocurrency of your choice",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              30.verticalSpace,
              GridView.builder(
                padding: EdgeInsets.only(bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: resp?.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if(widget.text=="Sell Gift Card"){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (ctx) => SellScreen(rate: resp[index].cardRate.toString()??'', assetId: resp[index].id.toString(),)),
                        );
                      }else{
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (ctx) => BuycardScreen(text:resp![index].cardName??'', rate: resp[index].cardRate.toString()??'' ,)),
                        );
                      }
                      // Navigator.push(
                      //   context,
                      //   CupertinoPageRoute(builder: (ctx) => SellScreen()),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Color(0xff101828),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                         ImageWidget(
                           onTap: () {
                             if(widget.text=="Sell Gift Card"){
                               Navigator.push(
                                 context,
                                 CupertinoPageRoute(builder: (ctx) => SellScreen(rate: resp[index].cardRate.toString()??'', assetId: resp[index].id.toString(),)),
                               );
                             }else{
                               Navigator.push(
                                 context,
                                 CupertinoPageRoute(builder: (ctx) => BuycardScreen(text:resp![index].cardName??'', rate: resp[index].cardRate.toString()??'' ,)),
                               );
                             }
                             // Navigator.push(
                             //   context,
                             //   CupertinoPageRoute(builder: (ctx) => SellScreen()),
                             // );
                           },
                           imageUrl: resp![index].cardLogo??'',
                         borderRadius: BorderRadius.circular(10),height: 60,width: 100,fit: BoxFit.cover,),
                          4.verticalSpace,
                          TextView(
                            text: resp![index].cardName??'',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: "Rate:",
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,

                              ),
                              3.horizontalSpace,
                              TextView(
                                text: "₦${resp![index].cardRate}",
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          TextView(
                            text: "Type: ${resp![index].cardType??''}",
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox();
  },
),
    );
  }

  void _listenToBuySellState(BuildContext context, BuyAndSellState state) {
    if(state is BuyAnSellloadingState){
      CustomDialogs.showLoading(context);
    }
    if(state is BuyAnSellfailiureState){
      context.pop();
    }
    if(state is GetAllCardsSuccessState){
      logger.w(state.response.data);
      context.pop();
    }
  }



}
