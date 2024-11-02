import 'package:ecommerce_delivery/core/services/services.dart';

import '../../core/class/crud.dart';
import '../../core/constant/api_link.dart';

class ArchiveData{
  Crud crud;
  ArchiveData(this.crud);
  getData(String id)async{
    var response = await crud.postData(AppLinks.getArchiveData, {
      'id':id,
    });
    return response.fold((l)=>l, (r)=>r);
  }
}