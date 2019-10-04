// import 'package:flutter/material.dart';
// import 'package:jdshop/provider/Cart.dart';
// import 'package:provider/provider.dart';

// class CartItem extends StatefulWidget {
//   CartItem({Key key}) : super(key: key);

//   _CartItemState createState() => _CartItemState();
// }

// class _CartItemState extends State<CartItem> {
//   @override
//   Widget build(BuildContext context) {
//     var cartProcider = Provider.of<Cart>(context);
//     return cartProcider.cartList.length > 0 ? Column(
//       children: cartProcider.cartList.map((v) {
//         return ListTile(
//           title: Text('$v'),
//           trailing: InkWell(
//             onTap: (){
//               cartProcider.deletaData(v);
//             },
//             child: Icon(Icons.delete),
//           ),
//         );
//       }).toList(),
//     ):Text('空');
//   }
// }
