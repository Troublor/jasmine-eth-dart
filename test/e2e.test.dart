import 'package:jasmine_eth/jasmine_eth.dart';
import 'package:test/test.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/json_rpc.dart';

import 'utils.dart';

void main() async {
  group("sdk", () {
    var sdk = new SDK(
        "https://rinkeby.infura.io/v3/e8e5b9ad18ad4daeb0e01a522a989d66");

    test("get balance", () async {
      var account = await SDK.createAccount();
      var balance = await sdk.balanceOf(account.address);
      print(balance);
    });

    test("claim TFC", () async {
      const signature =
          '0xa7e2e63133b1671b52d885de5acf8b5e407301cc81795b364e139ab60a8d1e3a7b9e67a47f84bae044f8a972bfc62458117b3d41ed18e0ae902d4272014895671c';
      var manager = sdk.manager(
          Address.fromHex("0xb402822CC243E8f86E28c2F79c67DAcD14A9cc01"));
      var nonce = BigInt.parse(
          "115792089237316195423570985008687907853269984665640564039457584007913129639935");
      var amount = BigInt.parse("1000000000000000000");
      var claimer = await SDK.retrieveAccount(
          "ebed9fb6edc4e965eae048a9ddefcd268f800925ba7371b8079558292e4f708b");
      await manager.claimTFC(amount, nonce, signature, claimer);
    });
  });
}
