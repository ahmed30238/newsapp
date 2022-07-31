import 'package:dio_package_practice/cubit/cubit.dart';
import 'package:dio_package_practice/shared/shared_items/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).science;
    return ListView.separated(
      itemBuilder: (context, index) => buildScreenItems(list[index],context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: list.length,
    );
  }
}
