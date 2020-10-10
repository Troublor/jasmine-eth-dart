import 'package:jasmine_eth/jasmine_eth.dart';

void main() async {
  // create a new Ethereum Account
  Account newAccount = await SDK.createAccount();

  // retrieve an existing account from privateKey
  String privateKey =
      "0x4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d";
  Account existingAccount = await SDK.retrieveAccount(privateKey);

  // instantiate a SDK object
  String ethereumEndpoint = "http://localhost:8545";
  SDK sdk = new SDK(ethereumEndpoint);

  // query ETH balance
  BigInt ethBalance = await sdk.balanceOf(existingAccount.address);

  // transfer 1 ETH, which is 10000000000000000 wei
  await sdk.transfer(
      newAccount.address, BigInt.parse("10000000000000000"), existingAccount);

  // get TFC-ERC20 instance, which is used to query TFC balance
  Address tfcAddress =
      Address.fromHex("0x44e3BAF945f70fA8a926A84563492662BC9a5c11");
  TFC tfc = sdk.tfc(tfcAddress);

  // get TFC-Manager instance, which is used to claim TFC
  Address managerAddress =
      Address.fromHex("0xb402822CC243E8f86E28c2F79c67DAcD14A9cc01");
  Manager manager = sdk.manager(managerAddress);

  // query TFC balance
  BigInt tfcBalance = await tfc.balanceOf(existingAccount.address);

  // claim TFC tokens using signature sign by administrator
  String signature =
      "0x6b04573d9a5b813e65b7afc77ca931bf1a5787ed1732622034355c75b39fe934194501f3431b2fed46581eaa486cdb636eebcb7f852d2105af4a4b53a25dd27e1c";
  BigInt amount =
      BigInt.parse("10000000000000000"); // claim 1 TFC token (18 decimals)
  BigInt nonce = BigInt.zero;
  await manager.claimTFC(amount, nonce, signature, newAccount);
}
