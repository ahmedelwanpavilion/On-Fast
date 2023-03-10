import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:on_fast/modules/menu/menu_screens/account_screens/order/rate_screen.dart';
import 'package:on_fast/shared/components/components.dart';
import 'package:on_fast/shared/images/images.dart';
import 'package:on_fast/widgets/item_shared/default_appbar.dart';

import '../../../../../shared/styles/colors.dart';
import '../../../../../widgets/cart/checkout/checkout_list_item.dart';
import '../../../../../widgets/item_shared/default_button.dart';

class TrackScreen extends StatelessWidget {
  TrackScreen(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(tr('track')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Pick Up',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 32,
                      width:80,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'New',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 70,
                      child: Stack(
                        children: [
                          Align(
                              alignment: AlignmentDirectional.center,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25.0,right: 20,left: 20),
                                child: separated(),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             itemBuilder(
                                 image: Images.pending,
                                 title: 'Pending',
                                 isSelected: title == 'Pending'||title == 'New'||title == 'Ready'||title == 'Completed'
                             ),
                              itemBuilder(
                                 image: Images.neww,
                                 title: 'New',
                                 isSelected: title == 'New'||title == 'Ready'||title == 'Completed'
                             ),
                              itemBuilder(
                                 image: Images.calendar,
                                 title: 'Ready',
                                 isSelected:title == 'Ready'||title == 'Completed'
                             ),
                              itemBuilder(
                                 image: Images.completed,
                                 title: 'Completed',
                                 isSelected: title == 'Completed'
                             ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 480,
                      child: ListView.separated(
                        itemBuilder: (c,i)=>CheckOutItem(),
                        separatorBuilder: (c,i)=>const SizedBox(height: 20,),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                      ),
                    ),
                   // if(title == 'Completed')
                    Center(
                      child: DefaultButton(
                        text: tr('rate'),
                        onTap: (){
                          navigateTo(context, RateScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget itemBuilder({
  required String image,
  required String title,
  required bool isSelected,
}){
    return Column(
      children: [
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: isSelected?HexColor('#FFE7AA'):Colors.grey.shade400
          ),
          alignment: AlignmentDirectional.center,
          child: Image.asset(image,width: 20,color: isSelected?defaultColor:Colors.grey.shade600,),
        ),
        Text(
          title,
          style: TextStyle(color: isSelected?defaultColor:Colors.black),
        ),
      ],
    );
  }

  Widget separated(){
    return SizedBox(
      height: 1,
      child: ListView.separated(
          itemBuilder: (c,i)=>Container(color: defaultColor,height: 1,width: 5,),
          separatorBuilder: (c,i)=>const SizedBox(width: 5,),
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 40,
      ),
    );
  }
}
