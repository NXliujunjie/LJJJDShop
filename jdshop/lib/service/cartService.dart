
class CartService {
  
  static addCart(item){

    //把对象转换成map类型的数据
    item = CartService.formatCartData(item);
    print(item);
  }

  //过滤数据
  static formatCartData(item){
    final Map data = new Map<String, dynamic>();
    data['_id'] = item.sId;
    data['title'] = item.title;
    data['price'] = item.price;
    data['selectAttr'] = item.selectAttr;
    data['count'] = item.count;
    data['pic'] = item.pic;
    //是否选中
    data['checket'] = true;
    return data;
  }
}