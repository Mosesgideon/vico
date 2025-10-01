import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vico/features/buy_sel/data/data/buy_sell_repo_impl.dart';
import 'package:vico/features/buy_sel/data/models/by_crypto_payload.dart';
import 'package:vico/features/buy_sel/domain/buy_sell_repo.dart';
import 'package:vico/features/buy_sel/presentation/bloc/buy_and_sell_bloc.dart';

import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_dialogs.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../../common/widgets/text_view.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/services/network/network_service.dart';
import '../../../account/data/repo_impl/profile_repo_impl.dart';
import '../../../account/presentations/bankbloc/bank_bloc.dart';
class ProceedCrypto extends StatefulWidget {
  final String amount;
  final String wallet;
  final String crrency;
  final String usdAmount;
  final String assetId;
  final String paymentProof;
  const ProceedCrypto({super.key, required this.amount, required this.wallet, required this.crrency, required this.usdAmount, required this.assetId, required this.paymentProof});

  @override
  State<ProceedCrypto> createState() => _ProceedCryptoState();
}

class _ProceedCryptoState extends State<ProceedCrypto> {
  final acc = BankBloc(ProfileRepositoryImpl(NetworkService()));
  final buy=BuyAndSellBloc(BuyAndSellRepositoryImpl(NetworkService()));
  @override
  void initState() {
    // TODO: implement initState
    acc.add(GetCompanyAccontEvent());
    super.initState();
  }

  final picke=ImagePicker();
  XFile? myfile;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        bgColor: Color(0xff0f172a),
        fgColor: Colors.grey,
        tittle: TextView(text: "Complete your purchase",fontSize: 18,fontWeight: FontWeight.w600,color:Colors.white,),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<BankBloc, BankState>(
          bloc: acc,
  listener:_listenToBankState,
  builder: (context, state) {
    if (state is BankAccountfailiureState) {
    // CustomDialogs.showLoading(context);
    return Center(child: AppPromptWidget());
    }
    if (state is CompanyAccountSuccessState) {
    logger.w(state.response.data);
    final accdetails = state.response.data;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(0.1)

              ),
              child: TextView(text: "Please send exactly ₦${widget.amount} to the account below. Do not send more or less than this amount.",color: Colors.grey,fontSize: 12,)),
          20.verticalSpace,
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Bank Details",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "Account Name:",
                      color: Colors.grey,
                    ),
                    TextView(
                      text: accdetails?.account?.name ?? '',
                      color: Colors.white,
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "Account Number:",
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        TextView(
                          text: accdetails?.account!.number ?? '',
                          color: Colors.white,
                        ),
                        5.horizontalSpace,
                        InkWell(
                          onTap: (){
                            FlutterClipboard.copy(
                              accdetails?.account!.number ?? '',
                            ).then((onValue){
                              CustomDialogs.showToast("Account number copied");
                            });
                          },
                          child: Icon(
                            Icons.copy_rounded,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(text: "Bank Name:", color: Colors.grey),
                    TextView(
                      text: accdetails?.account?.bank ?? '',
                      color: Colors.white,
                    ),
                  ],
                ),
                10.verticalSpace,
                Divider(),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "Amount to Pay:",
                      color: Colors.grey,
                    ),
                    TextView(
                      text: "₦${widget.amount}",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(0.1)

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "Crypto Details",color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(text: "Cryptocurrency:",color: Colors.grey,),
                      TextView(text: widget.crrency,color: Colors.white,),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(text: "Amount:",color: Colors.grey,),
                      TextView(text: widget.amount,color: Colors.white,),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(text: "Receiving Wallet:",color: Colors.grey,),
                      10.horizontalSpace,
                      Expanded(child: TextView(text: widget.wallet,color: Colors.white,maxLines: 1,textOverflow: TextOverflow.ellipsis,)),
                    ],
                  ),

                ],
              )),
          20.verticalSpace,
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(0.1)

              ),
              child: TextView(text: "Ensure to take a screenshot/snapshot of the transfer confirmation page and upload it below for verification.",color: Colors.yellowAccent.withOpacity(0.5),fontSize: 11,)),
          30.verticalSpace,
          myfile!=null?Container(
            padding: EdgeInsets.only(top: 10),
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all()
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    2.horizontalSpace,
                    InkWell(
                        splashColor: Colors.transparent,
                        onTap: (){
                          setState(() {
                            myfile=null;
                          });
                        },

                        child: Icon(Icons.cancel_rounded,color: Colors.grey,))
                  ],
                ),
                10.verticalSpace,
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(myfile!.path,),fit: BoxFit.cover)

                  ),
                ),
              ],
            ),
          ):InkWell(
            onTap: () {
              _takeimage();
            },
            child: Container(
              width: 1.sw,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload_file_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  2.verticalSpace,

                  TextView(
                    text: "Click to upload image",
                    color: Colors.grey,
                  ),
                  2.verticalSpace,
                  TextView(
                    text: "PNG , JPG, JPEG",
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),


          40.verticalSpace,
          BlocConsumer<BuyAndSellBloc, BuyAndSellState>(
            bloc: buy,
  listener: _listenToBuyCrypto,
  builder: (context, state) {
    return CustomButton(child: TextView(text: "Confirm",color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16,), onPressed: (){
      buyCoin();
    });
  },
),
          60.verticalSpace,
        ],
      ),
    );
    }
   return SizedBox();
  },
),
      ),
    );
  }

  Future<void> _takeimage() async {
    var pickimagge=await picke.pickImage(source: ImageSource.gallery);
    if(pickimagge==null)return;
    setState(() {
      myfile=pickimagge;
    });
  }
  void _listenToBankState(BuildContext context, BankState state) {
    if (state is BankAccountLoaingState) {
      CustomDialogs.showLoading(context);
    }
    if (state is BankAccountfailiureState) {
      // CustomDialogs.showLoading(context);
      context.pop();
    }
    if (state is CompanyAccountSuccessState) {
      logger.w(state.response.data);
      context.pop();
    }
  }
  

  void _listenToBuyCrypto(BuildContext context, BuyAndSellState state) {
    if(state is BuyAnSellloadingCrptoState){
      CustomDialogs.showLoading(context);
    }
    if(state is BuyAnSellfailiureState){
      context.pop();
      CustomDialogs.showToast(state.error);
    }
    if(state is BuyCryptoSuccessState){
      context.pop();
      CustomDialogs.success("Purchase Successful");
      context.pop();
    }
  }

  void buyCoin() {
    buy.add(BuyCryptoEvent(BuyCryptoPayload(assetType:"coin",
        assetId: widget.assetId.toString(),
        transactionType: "buy",
        usdAmount: widget.usdAmount.toString(),
        receivingWalletAddress:widget.wallet,
        paymentProof: myfile?.path)));
  }
}
