import 'package:flutter/material.dart';

import '../Const/const.dart';
class BestForYou extends StatelessWidget {
  const BestForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10,),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, index) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 10,right: 10),
            leading: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage('https://cdn.pixabay.com/photo/2014/07/10/17/18/large-home-389271_1280.jpg'), fit: BoxFit.cover)),
            ),
            title: Text(
              'Best for you',
              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. 2.500.000.000 / Year',
                  style: kTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.bedroom_parent,
                          color: kSubTitleColor,
                          size: 15,
                        ),
                        Text(
                          ' 6 Bedroom',
                          style: kTextStyle.copyWith(
                            color: kSubTitleColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.bathtub_outlined,
                          color: kSubTitleColor,
                          size: 15,
                        ),
                        Text(
                          ' 4 Bathroom',
                          style: kTextStyle.copyWith(
                            color: kSubTitleColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
