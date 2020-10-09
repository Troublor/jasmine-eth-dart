// import 'dart:io';
//
// import 'package:test/test.dart';
// import 'package:web3dart/crypto.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:http/http.dart'; //You can also import the browser version
//
// import 'package:jasmine_eth/sdk.dart';
//
// void main() {
//   group("Provider asyncTransaction", () {
//     MockEthereum mockEth;
//     Provider provider;
//     setUpAll(() async {
//       mockEth = new MockEthereum();
//       await mockEth.start();
//       var web3client = new Web3Client(mockEth.endpoint, new Client());
//       provider = new ProviderWrapper(web3client);
//     });
//
//     tearDownAll(() async {
//       await mockEth.stop();
//       mockEth = null;
//       provider = null;
//     });
//
//     Future<String> etherTransfer(
//         Address recipient, BigInt amount, Account sender) async {
//       return provider.web3.sendTransaction(
//           sender.credentials,
//           Transaction(
//               to: recipient.ethereumAddress, value: EtherAmount.inWei(amount)),
//           fetchChainIdFromNetworkId: true);
//     }
//
//     test("should not resolve Future if transaction is not mined", () async {
//       await mockEth.stop();
//       await mockEth.start(blockTime: 100); // simulate as if it never mines
//       provider =
//           new ProviderWrapper(new Web3Client(mockEth.endpoint, new Client()));
//       List<Account> predefinedAccounts = await Future.wait(
//           predefinedPrivateKeys.map((key) => Account.retrieve(key)));
//       var txHash = await etherTransfer(
//           predefinedAccounts[1].address, BigInt.one, predefinedAccounts[0]);
//
//       var future = provider.asyncTransaction(txHash, 0);
//       await future.timeout(Duration(seconds: 1), onTimeout: () => null);
//       expect(future, doesNotComplete);
//       await mockEth.stop();
//       await mockEth.start();
//     });
//   });
// }
//
// class ProviderWrapper with Provider {
//   ProviderWrapper(Web3Client web3client) {
//     this.web3 = web3client;
//   }
// }
