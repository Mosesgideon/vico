import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/error_widget.dart';
import 'package:vico/common/widgets/image_widget.dart';

import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/features/transactions/data/data/tansactions_repo_impl.dart';
import 'package:vico/features/transactions/domain/tansactions_repo/tansactions_repo.dart';
import 'package:vico/features/transactions/presentations/bloc/transactions_bloc.dart';

import '../../../../core/theme/pallets.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final transactionbloc = TransactionsBloc(
    TransactionRepositoryImpl(NetworkService()),
  );
  @override
  void initState() {
    transactionbloc.add(GetTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101828),
      appBar:AppBar(
        backgroundColor: Color(0xff101828),
        leading:SizedBox(),
        centerTitle: false,
        title: TextView(text: "Transactions",  fontSize: 20,
        color: Colors.white,),
      ),
      // CustomAppBar(
      //   bgColor: Color(0xff101828),
      //   leading: SizedBox(),
      //   tittle: TextView(
      //     text: "",
      //     fontSize: 20,
      //     color: Colors.white,
      //   ),
      // ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocConsumer<TransactionsBloc, TransactionsState>(
          bloc: transactionbloc,
  listener:_listenoTransactioState,
  builder: (context, state) {
    if(state is TransactionsFailiure){
      return Center(child: AppPromptWidget(),);

    }
    if(state is TransactionsSuccess){
      final trans=state.response.data?.transactions;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: List.generate(
              trans!.length,
                  (ctx) => InkWell(
                    onTap: (){
                      CustomDialogs.showCustomDialog(Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(text: "Transaction Reciept",fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white,),
                              InkWell(
                                onTap: (){
                                  context.pop();
                                },
                                  child: Icon(Icons.cancel_rounded,color: Colors.grey,)),
                              ],
                            ),
                            Divider(color: Colors.grey.withOpacity(0.3),),
                            10.verticalSpace,
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             TextView(text: "Transaction Type",color: Colors.grey,),
                             TextView(text: trans[ctx].transactionType?.toUpperCase()??'',color: Colors.white,),

                           ],
                         ),
                            10.verticalSpace,
                            Divider(color: Colors.grey.withOpacity(0.3),),

                            trans[ctx].coinDetails?.coinAmount==null?SizedBox(): TextView(text: "Amount in Dispute",color: Colors.grey,),
                            trans[ctx].coinDetails?.coinAmount==null?SizedBox(): 10.verticalSpace,
                            trans[ctx].coinDetails?.coinAmount==null?SizedBox():TextView(text: "${trans[ctx].coinDetails?.coinAmount.toString()}",color: Colors.white,),

                            trans[ctx].coinDetails?.coinAmount==null?SizedBox():10.verticalSpace,

                            trans[ctx].coinDetails?.coinAmount==null?SizedBox():
                            Divider(color: Colors.grey.withOpacity(0.3),),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(text: "Amount In USD",color: Colors.grey,),
                                TextView(text: "\$${trans[ctx].usdAmount.toString()}",color: Colors.white,),

                              ],
                            ),
                            10.verticalSpace,
                            Divider(color: Colors.grey.withOpacity(0.3),),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               TextView(text: "Amount In NG(Naira)",color: Colors.grey,),
                               5.verticalSpace,
                               TextView(text: "₦${trans[ctx].amount.toString()}",color: Colors.white,),

                             ],
                           ),




                            10.verticalSpace,
                            Divider(color: Colors.grey.withOpacity(0.3),),
                            trans[ctx].paymentProof==null?SizedBox(): TextView(text: "Transaction Proof",color: Colors.grey,),
                            5.verticalSpace,
                            trans[ctx].paymentProof==null?SizedBox(): ImageWidget(imageUrl: trans[ctx].paymentProof??'',height: 150,width: 1.sw,)
                          ],
                        ),
                      ), context);
                    },
                    child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1e2939),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: trans?[ctx].description??'',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        5.verticalSpace,
                        Row(
                          children: [
                            
                            Text(trans?[ctx].coinDetails?.coinAmount.toString()??'',
                              style: TextStyle(color:trans?[ctx].transactionType=="sell"?Pallets.successGreen: Colors.red, fontSize: 15,decoration:TextDecoration.lineThrough ),
                            ),


                            trans?[ctx].coinDetails?.coinAmount==null?SizedBox(): 20.horizontalSpace,
                            Text("₦${trans?[ctx].amount.toString()??''}",
                              style: TextStyle(color:trans?[ctx].transactionType=="sell"?Pallets.successGreen: Colors.red, fontSize: 15),
                            ),

                          ],
                        ),
                        5.verticalSpace,

                        Row(
                          children: [
                            TextView(
                              text: DateFormat("dd MMM yyyy, hh:mm a").format(
                                DateTime.parse(trans?[ctx].createdAt.toString() ?? ""),
                              ),
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            10.horizontalSpace,
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff1c2d52),
                              ),
                              child: TextView(text: trans?[ctx].transactionType??'', color: Colors.white),
                            ),
                            10.horizontalSpace,
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:trans?[ctx].status=="completed"?Pallets.successGreen.withOpacity(0.2): Color(0xff372f2a),
                              ),
                              child: TextView(
                                text: trans?[ctx].status??'',
                                color: trans?[ctx].status=="completed"?Pallets.successGreen:Colors.yellowAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                                    ),
                                  ),
                  ),
            ),
          ),
        ),
      );
    }
   return SizedBox();
  },
),
      ),
    );
  }

  void _listenoTransactioState(BuildContext context, TransactionsState state) {
    if(state is TransactionsLoading){
      CustomDialogs.showLoading(context);
    }
    if(state is TransactionsFailiure){
      context.pop();

    }
    if(state is TransactionsSuccess){
      context.pop();
    }
  }
}
