import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class AcceptedData{
  Crud crud;
  AcceptedData(this.crud);
  getData(String id)async{
    var response = await crud.postData(AppLinks.acceptedOrders, {
      'id':id,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  completeDelivered(String orderId,String userId,String deliveryId)async{
    var response =await crud.postData(AppLinks.completeDelivery,{
      'orderid':orderId,
      'userid': userId,
      'delivery_id': deliveryId,
    });
    return response.fold((l)=>l, (r)=>r);

  }
}