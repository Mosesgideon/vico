import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_button.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/filled_textfield.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/di/injector.dart';
import 'package:vico/core/navigation/route_url.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/theme/pallets.dart';
import 'package:vico/features/account/data/repo_impl/profile_repo_impl.dart';
import 'package:vico/features/account/presentations/profile/profile_bloc.dart';
import 'package:vico/features/authentication/presentations/user_bloc/user_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/info_dialog.dart';
import '../../../../core/services/data/session_manager.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff101828),

      appBar: CustomAppBar(
        fgColor: Colors.white,
        bgColor:  Color(0xff101828),
        tittle: TextView(
          text: "My Profile",color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(text: "Profile Information",color: Colors.white, fontSize: 18),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      context.pushNamed(PageUrl.edit_profile);
                    },
                    child: Row(
                      children: [
                        Icon(Iconsax.edit_2, size: 20, color: Color(0xffFE67002)),
                        5.horizontalSpace,
                        TextView(text: "Edit", color: Color(0xffFE67002)),
                      ],
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Divider(),
              50.verticalSpace,
              Center(child:CircleAvatar(radius: 55,),),

              30.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.user,color: Colors.grey,),
                      10.horizontalSpace,
                      TextView(text: "Name",color: Colors.grey,fontSize: 18,),
                     
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:35),
                    child: TextView(text: "Moses Gideon",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,),
                  )
                ],
              ),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email_outlined,color: Colors.grey,),
                      10.horizontalSpace,
                      TextView(text: "Email",color: Colors.grey,fontSize: 18,),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:35),
                    child: TextView(text: "mosesgideon072@gmail.com",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,),
                  )
                ],
              ),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email_outlined,color: Colors.grey,),
                      10.horizontalSpace,
                      TextView(text: "Phone Number",color: Colors.grey,fontSize: 18,),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:35),
                    child: TextView(text: "+234(0)7042973460",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }



}




