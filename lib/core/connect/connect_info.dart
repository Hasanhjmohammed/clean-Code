import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectInfo{
  get connectchecker ;
}

class ConnectinfoImplement implements ConnectInfo{
  @override
  InternetConnectionChecker internetconnect;
  ConnectinfoImplement({required this.internetconnect});
Future<bool>  get connectchecker async =>  await internetconnect.hasConnection;

}