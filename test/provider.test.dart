import 'dart:async';
import 'dart:io';

import 'package:test/test.dart';
import 'package:matcher/matcher.dart';

import 'package:jasmine_eth/jasmine_eth.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import 'utils.dart';

Future<String> sendTransferTransaction(
    SDK sdk, Address recipient, BigInt amount, Account sender) async {
  return await sdk.web3.sendTransaction(
      EthPrivateKey.fromHex(sender.privateKey),
      Transaction(
        to: EthereumAddress.fromHex(recipient.hex),
        value: EtherAmount.inWei(amount),
        nonce: await sdk.web3.getTransactionCount(
            EthereumAddress.fromHex(sender.address.hex),
            atBlock: BlockNum.pending()),
      ),
      fetchChainIdFromNetworkId: true);
}

void main() {
  group("Provider asyncTransaction (controlled mine blockchain)", () {
    MockEthereum mockEth;
    SDK sdk;
    List<Account> predefinedAccounts;
    setUpAll(() async {
      mockEth = new MockEthereum();
      await mockEth.start(blockTime: 5000);
      sdk = new SDK(mockEth.endpoint);
      predefinedAccounts = await mockEth.predefinedAccounts();
    });

    setUp(() async {
      // flush pending transaction, this is due to a bug that ganache cannot get correct nonce when there are pending transactions
      await mockEth.mineBlock();
    });

    tearDownAll(() async {
      await mockEth.stop();
      mockEth = null;
      sdk = null;
    });

    test("should not resolve Future if transaction is not mined", () async {
      var hash = await sendTransferTransaction(sdk,
          predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
      var future = sdk.asyncTransaction(hash, 0);
      await expectFutureNotComplete(future, Duration(milliseconds: 200));
      await mockEth.mineBlock();
      expect(future, completion(isA<TransactionReceipt>()));
    });

    test("should resolve Future if transaction is mined", () async {
      var hash = await sendTransferTransaction(sdk,
          predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
      await mockEth.mineBlock();
      var future = sdk.asyncTransaction(hash, 0);
      expect(future, completion(isA<TransactionReceipt>()));
    });

    test("should not resolve Future if confirmation requirement is not met",
        () async {
      var hash = await sendTransferTransaction(sdk,
          predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
      await mockEth.mineBlock();
      var future = sdk.asyncTransaction(hash, 1);
      await expectFutureNotComplete(future, Duration(milliseconds: 500));
      await mockEth.mineBlock();
      expect(future, completion(isA<TransactionReceipt>()));
    });

    test("should resolve Future if confirmation requirement is met", () async {
      var hash = await sendTransferTransaction(sdk,
          predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
      await mockEth.mineBlock();
      await mockEth.mineBlock();
      var future = sdk.asyncTransaction(hash, 1);
      expect(future, completion(isA<TransactionReceipt>()));
    });
  });

  group("Provider asyncTransaction (instant mine blockchain)", () {
    MockEthereum mockEth;
    SDK sdk;
    List<Account> predefinedAccounts;
    setUpAll(() async {
      mockEth = new MockEthereum();
      await mockEth.start();
      sdk = new SDK(mockEth.endpoint);
      predefinedAccounts = await mockEth.predefinedAccounts();
    });

    tearDownAll(() async {
      await mockEth.stop();
      mockEth = null;
      sdk = null;
    });

    test("should resolve Future if confirmation requirement is 0", () async {
      var hash = await sendTransferTransaction(sdk,
          predefinedAccounts[0].address, BigInt.one, predefinedAccounts[1]);
      var future = sdk.asyncTransaction(hash, 0);
      var receipt = await future;
      expect("0x" + bytesToHex(receipt.transactionHash), hash);
    });
  });
}
