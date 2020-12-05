import 'package:jasmine_eth/jasmine_eth.dart';

void main() async {
  print("Dart SDK check TFC balance:");
  var start = new DateTime.now();
  var sdk = new SDK("http://103.253.11.146:8552");
  var tfc = sdk.tfc(Address.fromHex("0x44e3BAF945f70fA8a926A84563492662BC9a5c11"));
  var acc = await SDK.retrieveAccount("0x4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d");
  var balance = await sdk.balanceOf(acc.address);
  print(acc.address.hex);
  var end = new DateTime.now();
  var elapsedTime = end.difference(start);
  print("balance = " + balance.toString());
  print("elapsed time: " + elapsedTime.toString() + "s");

}
