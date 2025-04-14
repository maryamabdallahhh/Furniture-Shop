import 'package:flutter/material.dart';
import 'package:shopapp/features/data/productdata.dart';
import 'package:shopapp/features/data/model.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  final double _currentPrice = 200;

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts =
        products.where((product) => product.price! >= _currentPrice).toList();
    return ListView.separated(
      itemBuilder: (context, index) {
        final myproduct = filteredProducts[index];
        // var myproduct = products[index];
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(myproduct.image!),
                            width: 200,
                            height: 200,
                          ),
                          Text(
                            '${myproduct.price}',
                          ),
                          Text(myproduct.descrption!),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.brown)),
                              onPressed: () {},
                              child: const Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: ListTile(
            leading: Image.asset(myproduct.image!),
            title: Row(
              children: [Text('${myproduct.price}'), const Text('\$')],
            ),
            subtitle: Text(myproduct.descrption!),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: filteredProducts.length,
    );
  }
}
