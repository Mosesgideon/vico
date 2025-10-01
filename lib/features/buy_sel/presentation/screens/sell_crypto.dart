import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/features/buy_sel/presentation/screens/buy_coin.dart';
import 'package:vico/features/buy_sel/presentation/screens/sell_coin.dart';
import 'package:vico/features/buy_sel/presentation/screens/sellcard_screen.dart';

import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_dialogs.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../../common/widgets/image_widget.dart';
import '../../../../common/widgets/text_view.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/services/network/network_service.dart';
import '../../data/data/buy_sell_repo_impl.dart';
import '../bloc/buy_and_sell_bloc.dart';
import 'buycard_screen.dart';
class BuySellCrypto extends StatefulWidget {
  final String text;
  const BuySellCrypto({super.key, required this.text});

  @override
  State<BuySellCrypto> createState() => _BuySellCryptoState();
}

class _BuySellCryptoState extends State<BuySellCrypto> {

  final buysellcrypto=BuyAndSellBloc(BuyAndSellRepositoryImpl(NetworkService()));
  @override
  void initState() {
    // TODO: implement initState
    buysellcrypto.add(GetAllCryptoEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        fgColor: Colors.grey,
        bgColor: Color(0xff0f172a),
        tittle: TextView(text: widget.text,color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18,),
      ),

      body: BlocConsumer<BuyAndSellBloc, BuyAndSellState>(
        bloc: buysellcrypto,
        listener: _listenToBuySellState,
        builder: (context, state) {
          if(state is BuyAnSellfailiureState){
            return Center(
              child: AppPromptWidget(),
            );

          }
          if(state is GetAllCryptoSuccessState){
            logger.w(state.response.data);
            final resp=state.response.data?.coins;
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
                            if(widget.text=="Sell Crypto"){
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (ctx) => SellCoin(name: resp![index].coinName??'', rate: resp![index].coinRate.toString()??'', assetId: resp![index].id.toString(),)),
                              );
                            }else{
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (ctx) => BuyCoin(name:  resp![index].coinName??'', rate: resp![index].coinRate.toString()??'', assetId: resp![index].id.toString(), )),
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
                                    if(widget.text=="Sell Crypto"){
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (ctx) => SellCoin(name: resp![index].coinName??'', rate: resp![index].coinRate.toString()??'', assetId: resp![index].id.toString(),)),
                                      );
                                    }else{
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (ctx) => BuyCoin(name:  resp![index].coinName??'', rate: resp![index].coinRate.toString()??'', assetId: resp![index].id.toString(), )),
                                      );
                                    }
                                    // Navigator.push(
                                    //   context,
                                    //   CupertinoPageRoute(builder: (ctx) => SellScreen()),
                                    // );
                                  },
                                  imageUrl: resp![index].coinImage??'',
                                  borderRadius: BorderRadius.circular(10),height: 60,width: 100,fit: BoxFit.cover,),
                                4.verticalSpace,
                                TextView(
                                  text: resp![index].coinName??'',
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
                                      text: "₦${resp![index].coinRate}",
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
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
    if(state is BuyAnSellloadingCrptoState){
      CustomDialogs.showLoading(context);
    }
    if(state is BuyAnSellfailiureState){
      context.pop();
    }
    if(state is GetAllCryptoSuccessState){
      logger.w(state.response.data);
      context.pop();
    }
  }

}
