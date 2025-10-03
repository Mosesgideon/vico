import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/error_widget.dart';
import 'package:vico/core/navigation/route_url.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/features/homescreen/data/data/dasboard_repo/dasboard_repo_impl.dart';
import 'package:vico/features/homescreen/domain/dasboard_repo/dsahboard_repo.dart';
import 'package:vico/features/homescreen/presentations/bloc/dashboard_bloc.dart';

import '../../../../common/widgets/image_widget.dart';
import '../../../../common/widgets/text_view.dart';
import '../../../../core/theme/pallets.dart';
class Brandnew extends StatefulWidget {
  const Brandnew({super.key});

  @override
  State<Brandnew> createState() => _BrandnewState();
}

class _BrandnewState extends State<Brandnew> {
  final dash=DashboardBloc(DashboardRepositoryImpl(NetworkService()));
  @override
  void initState() {
    // TODO: implement initState
    dash.add(GetDashboardEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: dash,
  listener:_listenToDashboardState,
  builder: (context, state) {
    if(state is DashboardfaliureState){
      return Center(
        child: AppPromptWidget(
          onTap: (){
            dash.add(GetDashboardEvent());
          },
        ),
      );
    }
    if(state is DashboardSuccessState){
      final dashresponse=state.response.data;
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
                                 TextView(text: "${dashresponse?.stats.first.value}",color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,),
                               ],
                             ),
                             CircleAvatar(radius: 25,child: Icon(Icons.trending_down_outlined,size: 25,),)
                           ],
                         ),
                         10.verticalSpace,
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             InkWell(
                               onTap: (){
                                 context.pushNamed(PageUrl.categories);
                               },
                               child: Container(
                                 alignment: Alignment.center,
                                 height: 40,
                                 width: 120,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                                     color: Colors.white),
                                 child: TextView(text: "Quick Trade",color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w600,),
                               ),
                             ),
                             InkWell(
                               onTap: (){
                                 context.pushNamed(PageUrl.mycart);
                               },
                               child: Container(
                                 alignment: Alignment.center,
                                 height: 40,
                                 width: 120,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                                     color: Colors.lightBlueAccent.withOpacity(0.2)),
                                 child: TextView(text: "View Details",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600,),
                               ),
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
               children: List.generate(dashresponse!.stats.length, (context)=>Padding(
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
                           TextView(text: dashresponse.stats[context].title.toString(),fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.6),),

                           TextView(text: "${dashresponse.stats[context].value.toString()}",fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,)
                         ],
                       ),
                       CircleAvatar(radius: 25,
                         child: Icon(Iconsax.buy_crypto),)

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
    return SizedBox();
  },
);

  }

  void _listenToDashboardState(BuildContext context, DashboardState state) {
    if(state is DashboardloadingState){
      CustomDialogs.showLoading(context);
    }
    if(state is DashboardfaliureState){
      context.pop();
    }
    if(state is DashboardSuccessState){
      context.pop();
    }
  }
}
