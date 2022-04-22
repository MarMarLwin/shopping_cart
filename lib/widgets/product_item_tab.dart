import 'package:flutter/material.dart';
import 'package:user_stories/utils/app_constants.dart';

import '../models/product.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'expandable_text.dart';

class ProductItemTab extends StatefulWidget {
  Product product;
  ProductItemTab({Key? key,required this.product}) : super(key: key);

  @override
  State<ProductItemTab> createState() => _ProductItemTabState();
}

class _ProductItemTabState extends State<ProductItemTab> with SingleTickerProviderStateMixin  {
  late TabController _tabController;
  late List tabs;
  int _currentIndex = 0;
  int selectColorIndex=-1;
  int selectSizeIndex=-1;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    tabs = ['Description', 'Customer Review'];
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  _tabsContent(Product product) {
    if (_currentIndex == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableText(text: product.description!, size: Dimension.dimen16),
          SizedBox(height: Dimension.dimen20),

          //select size
          BigText(text: 'Select Size'),
          SizedBox(height: Dimension.dimen10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(AppConstant.kSize.length, (index) =>GestureDetector(
              onTap: (){
                setState(() {
                  selectSizeIndex=index;
                });
              },
              child: Container(
                width: Dimension.dimen30,
                height: Dimension.dimen30,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: Dimension.dimen10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.dimen30 / 2),
                    color:selectSizeIndex==index?primaryColor: Colors.black26),
                child: BigText(
                    text: AppConstant.kSize[index]!, size: Dimension.dimen20, color: Colors.white),
              ),
            ),),
          ),

          SizedBox(height: Dimension.dimen20),

          //select color
          BigText(text: 'Select Color'),
          SizedBox(height: Dimension.dimen10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(AppConstant.kColor.length, (index) =>GestureDetector(
              onTap: (){
                setState(() {
                  selectColorIndex=index;
                });
              },
              child: Container(
                width: Dimension.dimen30,
                height: Dimension.dimen30,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: Dimension.dimen10),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Dimension.dimen30 / 2),
                    color: AppConstant.kColor[index]),
                child: Visibility(
                    visible: selectColorIndex==index,
                    child: Icon(Icons.done, color: Colors.white)),
              ),
            ),),
          ),
        ],
      );
    } else if (_currentIndex == 1) {
      return Container(
        child: BigText(text: 'Customer review'),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimension.dimen10, right: Dimension.dimen10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.black26,
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
          SizedBox(height: Dimension.dimen10),
          _tabsContent(widget.product),
        ],
      ),
    );
  }
}
