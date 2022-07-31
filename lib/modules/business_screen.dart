import 'package:dio_package_practice/cubit/cubit.dart';
import 'package:dio_package_practice/shared/shared_items/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).business;
        return ListView.separated(
          itemBuilder: (context, index) => buildScreenItems(list[index],context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: NewsCubit.get(context).business.length,
        );
      },
    );
  }
}
