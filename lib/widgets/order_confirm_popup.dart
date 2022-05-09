import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/utils/app_constants.dart';
import 'package:user_stories/widgets/big_text.dart';
import '../helper/route_helper.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';


class OrderConfirmPopup extends StatefulWidget {
  final String orderNo;
  int select=-1;
   OrderConfirmPopup({Key? key,required this.orderNo}) : super(key: key);

  @override
  State<OrderConfirmPopup> createState() => _OrderConfirmPopupState();
}

class _OrderConfirmPopupState extends State<OrderConfirmPopup> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(Dimension.dimen20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BigText(text: 'YOUR ORDER CREATE'),
          BigText(text:widget.orderNo,size: Dimension.dimen16,color: Colors.black38, ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.dimen20),
              color: Colors.white,
              image: const DecorationImage(
                  image: AssetImage(
                      'images/congratulations.jpeg'),
                  fit: BoxFit.cover),
            ),
            width: Dimension.dimen110,
            height: Dimension.dimen110,
          ),
          SizedBox(height: Dimension.dimen20),
          BigText(text: 'Thanks for ordering.'),
          SizedBox(height: Dimension.dimen10),
          BigText(text: 'Rating for your order.'),
          SizedBox(height: Dimension.dimen20),
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: List<Widget>.generate(5, (index) =>GestureDetector(onTap:(){
    setState(() {
      widget.select=index;
    });
  },child: Icon(widget.select<index?Icons.star_border:Icons.star,size: Dimension.dimen30,color: Colors.orangeAccent,))),
),
          SizedBox(height: Dimension.dimen20,),
          SizedBox(
            width: Get.width - Dimension.dimen30 * 2,
            height: Dimension.dimen50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              child: BigText(text: 'Submit',color: Colors.white,size: Dimension.dimen16),
              onPressed: () {
                 Get.back();

                 GetStorage().write('cart_count',0);
                 Get.offAndToNamed(RouteHelper.getHome());

              },
            ),
          ),
        ],
      ),
    );
  }
}
