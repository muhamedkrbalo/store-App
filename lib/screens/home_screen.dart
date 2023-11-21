import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: const Text(
          'New Tren',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:FutureBuilder<List<ProductModel>>(
        future: GetAllProductService().getAllProduct(), 
        builder: (context,snapshot){
          if (snapshot.hasData) {
  return Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
          child: GridView.builder(
            itemCount: snapshot.data!.length,
  clipBehavior: Clip.none,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount:2,
    childAspectRatio: 1.2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 50
     ), 
  itemBuilder: (context,index){
  return  CustomCard(product: snapshot.data![index],);
          }),
        );
}else{
  return const Center(child: CircularProgressIndicator());
}
    
        })
    );
  }
}

