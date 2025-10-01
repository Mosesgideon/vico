import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/features/buy_sel/data/models/sell_coin_payload.dart';

import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/outlined_form_field.dart';
import '../../../../core/services/network/network_service.dart';
import '../../../../core/theme/pallets.dart';
import '../../../account/data/models/account_response.dart';
import '../../../account/data/repo_impl/profile_repo_impl.dart';
import '../../../account/presentations/bankbloc/bank_bloc.dart';
import '../../data/data/buy_sell_repo_impl.dart';
import '../bloc/buy_and_sell_bloc.dart';

class SellCoin extends StatefulWidget {
  final String rate;
  final String name;
  // assetType;
  final String assetId;
  //
  const SellCoin({
    super.key,
    required this.name,
    required this.rate,
    required this.assetId,
  });

  @override
  State<SellCoin> createState() => _SellCoinState();
}

class _SellCoinState extends State<SellCoin> {
  final pickimage = ImagePicker();
  XFile? myfile;
  final usdController = TextEditingController();
  final numberController = TextEditingController();
  final key = GlobalKey<FormState>();

  final sellbloc = BuyAndSellBloc(BuyAndSellRepositoryImpl(NetworkService()));
  final bankbloc = BankBloc(ProfileRepositoryImpl(NetworkService()));

  @override
  void initState() {
    super.initState();
    usdController.addListener(() {
      setState(() {});
    });

    bankbloc.add(GetBankAccontEvent());
  }

  GetUserAccontResponse? accontResponse;

  String? selectedAccount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        tittle: TextView(
          text: "Sell ${widget.name}",
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        fgColor: Colors.grey,
        bgColor: Color(0xff0f172a),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Sell Yor ${widget.name}",
                  fontSize: 20,
                  color: Colors.white,
                ),
                20.verticalSpace,
                Row(
                  children: [
                    TextView(text: "Amount in USD", color: Colors.grey),
                    TextView(text: "*", color: Colors.red),
                  ],
                ),
                OutlinedFormField(
                  controller: usdController,
                  validator:
                      MultiValidator([
                        RequiredValidator(errorText: 'This field is required'),
                      ]).call,
                  hint: "0.0",

                  preffix: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: TextView(
                      text: "\$",
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                ),
                15.verticalSpace,
                Row(
                  children: [
                    TextView(
                      text: "Amount in ${widget.name}",
                      color: Colors.grey,
                    ),
                    TextView(text: "*", color: Colors.red),
                  ],
                ),
                OutlinedFormField(
                  hint: "0.0000000",
                  controller: numberController,
                  validator:
                      MultiValidator([
                        RequiredValidator(errorText: 'This field is required'),
                      ]).call,
                  preffix: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: TextView(
                      text: "\$",
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                ),
                15.verticalSpace,
                Row(
                  children: [
                    TextView(text: "Receive Payment To", color: Colors.grey),
                    TextView(text: "*", color: Colors.red),
                  ],
                ),
                // OutlinedFormField(
                //   validator:
                //   MultiValidator([
                //     RequiredValidator(errorText: 'This field is required'),
                //   ]).call,
                //
                //   hint: "343355566",
                //   preffix: CircleAvatar(
                //     backgroundColor: Colors.transparent,
                //     child: Icon(Icons.wallet_rounded,),
                //   ),
                // ),
                10.verticalSpace,
                DropdownButtonHideUnderline(
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Pallets.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BlocConsumer<BankBloc, BankState>(
                      bloc: bankbloc,
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is BankAccountLoaingState) {
                          return Center(
                            child: TextView(
                              text: "Fetching bank account...",
                              color: Colors.grey,
                            ),
                          );
                        }
                        if (state is BankAccountfailiureState) {
                          return InkWell(
                            child: Row(
                              children: [
                                TextView(text: "Error occured!"),
                                3.horizontalSpace,
                                Icon(
                                  Icons.refresh_outlined,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          );
                        }
                        if (state is BankAccountSuccessState) {
                          final accounts = state.response.data?.accounts;
                          accontResponse = state.response;
                          return DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                const TextView(
                                  text: "-----",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Pallets.grey75,
                                ),
                                3.horizontalSpace,
                                const TextView(
                                  text: "Select account",
                                  fontSize: 16,
                                  color: Pallets.grey75,
                                ),
                                3.horizontalSpace,
                                const TextView(
                                  text: "-----",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Pallets.grey75,
                                ),
                              ],
                            ),
                            value: selectedAccount,
                            onChanged: (String? value) {
                              setState(() {
                                selectedAccount = value;
                              });
                            },
                            items:
                                accounts?.map<DropdownMenuItem<String>>((
                                  account,
                                ) {
                                  final displayText =
                                      "${account.bank} - ${account.number}";
                                  final value = account.id.toString();

                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: TextView(
                                      text: displayText,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  );
                                }).toList(),

                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 250.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2a2b3c),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Iconsax.arrow_down_1,
                                color: Pallets.grey75,
                              ),
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                ),

                15.verticalSpace,
                Row(
                  children: [
                    TextView(
                      text: "Upload Transaction Image",
                      color: Colors.grey,
                    ),
                    TextView(text: "*", color: Colors.red),
                  ],
                ),
                10.verticalSpace,
                myfile != null
                    ? Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              2.horizontalSpace,
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    myfile = null;
                                  });
                                },

                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(myfile!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : InkWell(
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
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "Current Rate:",
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    TextView(
                      text: "${widget.rate.toString()} per \$1",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "You will receive:",
                      color: Colors.grey,
                      fontSize: 15,
                    ),

                    TextView(
                      text: ((double.tryParse(usdController.text.trim()) ?? 0) *
                              (double.tryParse(widget.rate.toString()) ?? 0))
                          .toStringAsFixed(2),
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ],
                ),
                30.verticalSpace,

                BlocConsumer<BuyAndSellBloc, BuyAndSellState>(
                  listener: _listentToSellstate,
                  bloc: sellbloc,
                  builder: (context, state) {
                    return CustomButton(
                      child: TextView(
                        text: "Confirm",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      onPressed: () {
                        sellcoin();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _takeimage() async {
    final imagefiles = await pickimage.pickImage(source: ImageSource.gallery);

    if (imagefiles == null) return;

    setState(() {
      myfile = imagefiles;
    });
  }

  void sellcoin() {
    sellbloc.add(
      SellCryptoEvent(
        SellCryptoPayload(
          assetType: "coin",
          assetId: widget.assetId,
          transactionType: "sell",
          usdAmount: numberController.text.trim(),
          receivingAccount: ReceivingAccount(
            bank: accontResponse?.data?.accounts.first.bank.toString(),
            number: accontResponse?.data?.accounts.first.number.toString(),
            name: accontResponse?.data?.accounts.first.name.toString(),
          ),
          paymentProof: myfile?.path,
        ),
      ),
    );
  }

  void _listentToSellstate(BuildContext context, BuyAndSellState state) {
    if (state is SellCryptoSuccessState) {
      context.pop();
      CustomDialogs.success("Success");
    }
    if (state is BuyAnSellfailiureState) {
      context.pop();
      CustomDialogs.error(state.error);
    }
    if (state is BuyAnSellloadingCrptoState) {
      CustomDialogs.showLoading(context);
    }
  }
}
