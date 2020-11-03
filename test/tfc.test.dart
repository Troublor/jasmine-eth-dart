import 'package:jasmine_eth/jasmine_eth.dart';
import 'package:test/test.dart';

void main() async {
  MockEthereum mockEth = new MockEthereum();
  List<Account> predefinedAccounts;
  SDK sdk;
  Manager manager;
  TFC tfc;
  setUpAll(() async {
    await mockEth.start();
    predefinedAccounts = await mockEth.predefinedAccounts();
    sdk = new SDK("http://localhost:8545");
    await sdk.deployManager(predefinedAccounts[0]);
    manager = sdk
        .manager(Address.fromHex("0xe78A0F7E598Cc8b0Bb87894B0F60dD2a88d6a8Ab"));
    var tfcAddress = await manager.tfcAddress();
    tfc = sdk.tfc(tfcAddress);
  });

  tearDownAll(() async {
    await mockEth.stop();
  });

  group("sdk", () {
    test("claim tfc and transfer tfc", () async {
      var amount = BigInt.from(1);
      var nonce = BigInt.from(0);
      var signature =
          "0x8548eafede184175a63121ad8419ab3fa649598bf59e63404a446ae404cfc8ce0a86a85ef8db66dde2096e7171ee6ba1b61950568fb60406dbc4ce13e0f5f5f01b";
      var claimer = predefinedAccounts[0];
      await manager.claimTFC(amount, nonce, signature, claimer);
      var balance = await tfc.balanceOf(claimer.address);
      expect(balance, equals(amount));
      var recipient = predefinedAccounts[1];
      await tfc.transfer(recipient.address, BigInt.one, claimer);
      balance = await tfc.balanceOf(claimer.address);
      expect(balance, equals(BigInt.zero));
      balance = await tfc.balanceOf(recipient.address);
      expect(balance, equals(BigInt.one));
    });
  });
}
