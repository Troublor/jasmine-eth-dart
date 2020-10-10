library sdk;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

part 'account.dart';

part 'address.dart';

part 'constants.dart';

part 'manager.dart';

part 'mock-ethereum.dart';

part 'tfc.dart';

part 'provider.dart';

/// The SDK used to interact with TFC ERC20 token
class SDK with _provider {
  SharedSettings _shared;

  /// To construct a SDK object, it requires a ethereum endpoint
  SDK(String ethereumEndpoint) {
    this.web3 = new Web3Client(ethereumEndpoint, new Client());
    this._shared = new SharedSettings();
  }

  /// Create a new Ethereum account.
  ///
  /// This method will return a future which completes with an [Account] object.
  /// The Ethereum address and private key can get from [Account] object.
  static Future<Account> createAccount() async {
    return Account.create();
  }

  /// Retrieve an existing Ethereum account using private key.
  ///
  /// This method will return a future which completes with an [Account] object.
  /// The Ethereum address and private key can get from [Account] object.
  static Future<Account> retrieveAccount(String privateKey) async {
    return Account.retrieve(privateKey);
  }

  /// Convert hexdecimals string to an [Address] object.
  ///
  /// If the input string is an invalid Ethereum address, this method will throw an [ArgumentError].
  static Address hexToAddress(String address) {
    return Address.fromHex(address);
  }

  /// Check if the input string is a valid Ethereum address.
  static bool isValidAddress(String address) {
    try {
      EthereumAddress.fromHex(address);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Query the ETH balance of the input address.
  ///
  /// This method will return a future which completes a [BigInt] in unit wei.
  Future<BigInt> balanceOf(Address address) async {
    var balance =
        await this.web3.getBalance(EthereumAddress.fromHex(address.hex));
    return balance.getInWei;
  }

  /// Transfer ETH
  Future<void> transfer(
      Address recipient, BigInt amount, Account sender) async {
    var txHash = await this.web3.sendTransaction(
        sender._credentials,
        Transaction(
          to: recipient._ethereumAddress,
          value: EtherAmount.inWei(amount),
          nonce: await this.web3.getTransactionCount(sender._address,
              atBlock: BlockNum.pending()),
        ),
        fetchChainIdFromNetworkId: true);
    // wait until the transaction is confirmed
    await this.asyncTransaction(txHash, this.confirmationRequirement);
  }

  /// Get [TFC] object, which represents TFC ERC20 smart contract.
  ///
  /// The input is the Ethereum [Address] of TFC ERC20 contract.
  TFC tfc(Address tfcAddress) => TFC._(this.web3, tfcAddress, this._shared);

  /// Get [Manager] object, which represents TFCManger smart contract.
  ///
  /// The input is the Ethereum [Address] of TFCManager contract.
  Manager manager(Address managerAddress) =>
      Manager._(this.web3, managerAddress, this._shared);

  /// Get current Ethereum transaction confirmation requirement
  int get confirmationRequirement => this._shared.confirmationNumber;

  /// Set Ethereum transaction confirmation requirement
  set confirmationRequirement(int confirmationRequirement) {
    this._shared.confirmationNumber = confirmationRequirement;
  }

  Future<Address> deployManager(Account deployer) async {
    var gas = await this.web3.estimateGas(
        sender: deployer._address,
        to: null,
        data: hexToBytes(Manager.bytecode));
    var txHash = await this.web3.sendTransaction(
        deployer._credentials,
        Transaction(
          to: null,
          data: hexToBytes(Manager.bytecode),
          maxGas: gas.toInt(),
        ));
    var receipt =
        await this.asyncTransaction(txHash, this.confirmationRequirement);
    return Address._fromEthereumAddress(receipt.contractAddress);
  }

  // Future<Address> deployTFC(Account deployer) async {
  //   var gas = await this.web3.estimateGas(
  //       sender: deployer._address,
  //       to: null,
  //       data: hexToBytes(TFC.bytecode));
  //   var txHash = await this.web3.sendTransaction(
  //       deployer._credentials,
  //       Transaction(
  //         to: null,
  //         data: hexToBytes(TFC.bytecode),
  //         maxGas: gas.toInt(),
  //       ));
  //   var receipt =
  //       await this.asyncTransaction(txHash, this.confirmationRequirement);
  //   return Address._fromEthereumAddress(receipt.contractAddress);
  // }
}

class SharedSettings {
  int confirmationNumber = 0;
}
