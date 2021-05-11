import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack_finance/metadata/meta_asset.dart';

class HomeLinkAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Link accounts",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_width * 0.05),
        child: Column(
          children: [
            LinkAccountItem(
              width: _width,
              title: "Wealth",
              titleAsset: MetaAsset.wealth,
              iconColor: Colors.deepPurple.shade400,
              accentColor: Colors.deepPurple.shade100.withOpacity(0.5),
              items: [
                LinkAccountIconItems.named(
                  asset: MetaAsset.mutualFunds,
                  title: "Mutual funds",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.stock,
                  title: "Stocks",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.fixedDeposit,
                  title: "Fixed Deposit",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.ppf,
                  title: "PPF",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.epf,
                  title: "EPF",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.nps,
                  title: "NPS",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.realEstate,
                  title: "Real Estate",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.gold,
                  title: "Gold",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.bond,
                  title: "Bonds",
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _width * 0.05),
              child: LinkAccountItem(
                width: _width,
                title: "Bank Accounts/Cash",
                titleAsset: MetaAsset.piggyBank,
                iconColor: Colors.green.shade400,
                accentColor: Colors.lightGreenAccent.shade100.withOpacity(0.4),
                items: [
                  LinkAccountIconItems.named(
                    asset: MetaAsset.bankAccount,
                    title: "Bank Account",
                    onPressed: () {},
                  ),
                  LinkAccountIconItems.named(
                    asset: MetaAsset.cash,
                    title: "Cash",
                    onPressed: () {},
                  )
                ],
              ),
            ),
            LinkAccountItem(
              width: _width,
              title: "Borrow",
              titleAsset: MetaAsset.borrow,
              iconColor: Colors.red.shade400,
              accentColor: Colors.red.shade50,
              items: [
                LinkAccountIconItems.named(
                  asset: MetaAsset.creditCard,
                  title: "Credit Card",
                  onPressed: () {},
                ),
                LinkAccountIconItems.named(
                  asset: MetaAsset.loans,
                  title: "Loans",
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LinkAccountIconItems {
  final String asset;
  final String title;
  final Function onPressed;

  LinkAccountIconItems(this.asset, this.title, this.onPressed);
  LinkAccountIconItems.named({this.asset, this.title, this.onPressed});
}

class LinkAccountItem extends StatelessWidget {
  final double width;
  final String titleAsset;
  final String title;
  final List<LinkAccountIconItems> items;
  final Color iconColor;
  final Color accentColor;

  const LinkAccountItem({
    Key key,
    @required this.width,
    @required this.titleAsset,
    @required this.title,
    @required this.items,
    @required this.iconColor,
    @required this.accentColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.all(width * 0.05),
      width: width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/link_account/wealth.svg",
                height: 20,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Wrap(
              runSpacing: 10,
              spacing: width * 0.025,
              children: items
                  .map((e) => InkWell(
                        onTap: e.onPressed,
                        child: SizedBox(
                          width: width * 0.175,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22)),
                                ),
                                margin: EdgeInsets.only(bottom: 8),
                                width: width * 0.15,
                                height: width * 0.15,
                                padding: EdgeInsets.all(width * 0.04),
                                child: SvgPicture.asset(
                                  e.asset,
                                  height: width * 0.11,
                                  width: width * 0.11,
                                  color: iconColor,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  e.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
