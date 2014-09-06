import 'package:polymer/polymer.dart';
import 'package:baasbox/baasbox.dart';
import 'dart:async';
import 'dart:html';


@CustomTag('baasbox-users-list')
class BaasBoxUsersList extends PolymerElement {  
  
  @observable List<BaasBoxUser> baasboxUsers = toObservable([]);

  BaasBoxUsersList.created() : super.created(); 
  

  void populateList(Event e, var detail, Node target) {
       baasboxUsers.clear();
       BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
       aBBUser.password = 'test';
       Future loginFuture = aBBUser.login();
       Future result = loginFuture.then((value) => aBBUser.fetchUsers().then( (onValue) 
           {
             for ( var user in onValue['data'] ) 
             {
               String name = user['user']['name'];
               print(name);
               baasboxUsers.add(new BaasBoxUser.withUserName(name));
             }
           }
       ));
  }
}