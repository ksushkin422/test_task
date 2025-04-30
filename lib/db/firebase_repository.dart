
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_task/db/response/categories_response.dart';
import 'package:test_task/db/response/products_response.dart';

class FirebaseRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future getRequest(String collection) async {
    CollectionReference _collectionRef =
    db.collection(collection);
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<CategoriesMainResponse> getCategoriesData() async {
    final allData = await getRequest('categories');
    return CategoriesMainResponse.fromData(allData);
  }

  Future<ProductsMainResponse> getProductsData() async {
    final allData = await getRequest('products');
    return ProductsMainResponse.fromData(allData);
  }

  Future<ProductsMainResponse> getProductsDataFiltered(val) async {
    CollectionReference _collectionRef =
    db.collection('products');
    QuerySnapshot querySnapshot = await _collectionRef.where("category_id", isEqualTo: val).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return ProductsMainResponse.fromData(allData);
  }
  
}
