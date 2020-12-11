import 'package:jasmine_eth/jasmine_eth.dart';
import 'package:test/test.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/json_rpc.dart';

import 'utils.dart';

void main() async {
  var mockEth = new MockEthereum();
  var predefinedAccounts = await mockEth.predefinedAccounts();

  setUpAll(() async {
    // await mockEth.start();
  });

  tearDownAll(() async {
    await mockEth.stop();
  });

  group("sdk", () {
    SDK sdk;
    setUp(() async {
      sdk = new SDK("http://localhost:8545");
      sdk.confirmationRequirement = 0;
    });

    tearDown(() async {
      sdk = null;
    });

    test("version", (){
      print(sdk.version.versionStr);
    });

    test("should deploy Manager correctly", () async {
      var managerAddr = await sdk.deployManager(predefinedAccounts[0]);
      var code =
          await sdk.web3.getCode(EthereumAddress.fromHex(managerAddr.hex));
      expect(code.length, greaterThan(0));
    });

    test("should create account correctly", () async {
      var account = await SDK.createAccount();
      expect(await EthPrivateKey.fromHex(account.privateKey).extractAddress(),
          equals(await EthereumAddress.fromHex(account.address.hex)));
    });

    test("should retrieve account correctly", () async {
      var account = await SDK.retrieveAccount(
          "0x4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d");
      expect(account.address.hex, "0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1");
    });

    test("should check ETH balance correctly", () async {
      var account = predefinedAccounts[predefinedAccounts.length - 1];
      var balance = await sdk.balanceOf(account.address);
      expect(balance, equals(BigInt.parse("100000000000000000000")));
    });

    test("should transfer ETH correctly", () async {
      var user = await SDK.createAccount();
      var balance = await sdk.balanceOf(user.address);
      expect(balance, BigInt.zero);
      var amount = BigInt.parse("1000000000000000000");
      await sdk.transfer(user.address, amount, predefinedAccounts[0]);
      balance = await sdk.balanceOf(user.address);
      expect(balance, amount);
    });

    test("should confirmation requirement make a difference", () async {
      sdk.confirmationRequirement = 1;
      var future = sdk.transfer(
          predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
      await expectFutureNotComplete(future, Duration(milliseconds: 500));

      sdk.confirmationRequirement = 0;
      future = sdk.transfer(
          predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
      expect(future, completion(isA<void>()));
    });

    test("should faucet work", () async {
      var acc = await SDK.createAccount();
      var balance0 = await sdk.balanceOf(acc.address);
      expect(balance0, equals(BigInt.zero));
      // faucet
      await sdk.faucet(acc.address);
      var balance1 = await sdk.balanceOf(acc.address);
      expect(balance1, equals(BigInt.one));
    });
  });

  group("manager", () {
    SDK sdk;
    Manager manager;
    TFC tfc;
    setUpAll(() async {
      sdk = new SDK("http://localhost:8545");
      sdk.confirmationRequirement = 0;
    });

    setUp(() async {
      var initialHolders = new List<Address>();
      initialHolders.add(predefinedAccounts[0].address);
      var managerAddr = await sdk.deployManager(predefinedAccounts[0]);
      manager = sdk.manager(managerAddr);
      var tfcAddr = await manager.tfcAddress();
      print("TFC Token: " + tfcAddr.hex);
      tfc = sdk.tfc(tfcAddr);
    });

    tearDown(() {
      manager = null;
    });

    tearDownAll(() {
      sdk = null;
    });

    test("should fail to claim TFC if signature is incorrect", () async {
      var sig = "0x1231251253215124";
      var future =
          manager.claimTFC(BigInt.one, BigInt.one, sig, predefinedAccounts[0]);
      expect(() async => await future, throwsA(isA<RPCError>()));
    });

    // test("should claim TFC successfully if signature is correct", () async {
    //   manager = sdk.manager(
    //       Address.fromHex("0xe78a0f7e598cc8b0bb87894b0f60dd2a88d6a8ab"));
    //   var sig =
    //       "0x6b04573d9a5b813e65b7afc77ca931bf1a5787ed1732622034355c75b39fe934194501f3431b2fed46581eaa486cdb636eebcb7f852d2105af4a4b53a25dd27e1c";
    //   expect(predefinedAccounts[0].address.hex,
    //       equals("0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1"));
    //   expect(predefinedAccounts[1].address.hex,
    //       equals("0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0"));
    //
    //   await manager.claimTFC(
    //       BigInt.one, BigInt.zero, sig, predefinedAccounts[1]);
    //   var balance = await tfc.balanceOf(predefinedAccounts[1].address);
    //   expect(balance, equals(BigInt.one));
    // });
  });
}
