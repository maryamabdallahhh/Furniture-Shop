import 'package:flutter/material.dart';
import 'package:shopapp/features/data/productdata.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filternames =
        products.where((products) => products.name!.contains(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'Dialog Title',
                desc: 'Dialog description here.............',
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )..show();
            },
            child: SizedBox(
              height: 20,
              child: query == ''
                  ? Text(products[index].name!)
                  : Text(filternames[index].name!),
            ),
          ),
        );
      },
      itemCount: query == '' ? products.length : filternames.length,
    );
  }
}
