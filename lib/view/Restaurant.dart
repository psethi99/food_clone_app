import 'package:flutter/material.dart';
import 'package:food_app/Models/restaurant_deatils.dart';
import 'package:food_app/utils/ui_helper.dart';
import 'package:food_app/widgets/veg_logo.dart';

class Divider extends StatelessWidget {
  final double dividerHeight;
  final Color? color;

  const Divider({
    Key? key,
    this.dividerHeight = 10.0,
    this.color,
  })  : assert(dividerHeight != 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dividerHeight,
      width: double.infinity,
      color: color ?? Colors.grey[200],
    );
  }
}

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0.0,
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
      body: _OrderNowView(),
    );
  }
}

class _OrderNowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 2.0, color: Colors.grey[500]!),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'The Dessert Heaven - Pure Veg',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        Icon(Icons.share),
                        Icon(Icons.favorite_border),
                      ],
                    ),
                    UIHelper.verticalSpaceMedium,
                    const Divider(dividerHeight: 1.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.green[400]),
                        Text(' 4.2 (100+ ratings)  '),
                        Icon(Icons.info),
                        Text('  ₹ 300 for two'),
                      ],
                    ),
                    const Divider(dividerHeight: 1.0),
                    UIHelper.verticalSpaceMedium,
                    Column(
                      children: <Widget>[
                        _buildOfferTile(
                            context, '30% off up to ₹75 | Use code SWIGGYIT'),
                        _buildOfferTile(context,
                            '20% off up to ₹100 with SBI credit cards, once per week | Use code 100SBI')
                      ],
                    ),
                    UIHelper.verticalSpaceSmall,
                  ],
                ),
              ),
          ),),
          const Divider(dividerHeight: 15.0),
          Container(
            height: 80.0,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const VegLogo(),
                      UIHelper.horizontalSpaceExtraSmall,
                      Text('PURE VEG',
                          style: Theme.of(context)
                              .textTheme.subtitle2!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16.0))
                    ],
                  ),
                ),
                const Divider(dividerHeight: 0.5, color: Colors.black)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Recommended',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontSize: 18.0),
            ),
          ),
          const _FoodListView(
            //title: '',
            foods: RestaurantDetail.cakes,
          ),
        ],
      ),
    );
  }

  Padding _buildOfferTile(BuildContext context, String desc) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.local_offer, color: Colors.red[600], size: 15.0),
            UIHelper.horizontalSpaceSmall,
            Flexible(
              child: Text(
                desc,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 13.0),
              ),
            )
          ],
        ),
      );

  Expanded _buildVerticalStack(
          BuildContext context, String title, String subtitle) =>
      Expanded(
        child: SizedBox(
          height: 60.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 15.0),
              ),
              UIHelper.verticalSpaceExtraSmall,
              Text(subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 13.0))
            ],
          ),
        ),
      );
}

class AddBtnView extends StatelessWidget {
  const AddBtnView({
    Key? key,
    required this.foods,
  }) : super(key: key);

  final RestaurantDetail  foods;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(foods.image, fit: BoxFit.cover,),
      OutlinedButton(
        onPressed: () => _showBottomSheet(context),
        child: Text('ADD'),
      ),
      ]
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildBottomSheet(context)
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Text('Select Weight',style: Theme.of(context).textTheme.subtitle2!
          .copyWith(color: Colors.green),
          ),
          CheckboxListTile(title: const Text('Small'), value: false, onChanged: (bool? value){},),
          CheckboxListTile(title: const Text('Medium'), value: false, onChanged: (bool? value){},),
          CheckboxListTile(title: const Text('Large'), value: false, onChanged: (bool? value){},)
        ]
      ),
    );
  }
}

class _FoodListView extends StatelessWidget {
  const _FoodListView({
    Key? key,
    required this.foods,
  }) : super(key: key);

  final List<RestaurantDetail> foods;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: foods.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceSmall,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const VegLogo(),
                      UIHelper.horizontalSpaceMedium,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              foods[index].title,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            UIHelper.verticalSpaceSmall,
                            Text(
                              foods[index].price,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                     const AddBtnView(foods: RestaurantDetail.cakes)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}