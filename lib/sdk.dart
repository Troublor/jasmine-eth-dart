library sdk;

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

part 'src/account.dart';

part 'src/address.dart';

part 'src/constants.dart';

part 'src/manager.dart';

part 'src/mock-ethereum.dart';

part 'src/tfc.dart';

part 'src/provider.dart';

/**
 * The SDK used to interact with TFC ERC20 token
 */
class SDK with _provider {
  /**
   * To construct a SDK object, it requires a ethereum endpoint
   */
  SDK(String ethereumEndpoint) {
    this.web3 = new Web3Client(ethereumEndpoint, new Client());
  }

  /**
   * Create a new Ethereum account.
   *
   * This method will return a future which completes with an [Account] object.
   * The Ethereum address and private key can get from [Account] object.
   */
  static Future<Account> createAccount() async {
    return Account.create();
  }

  /**
   * Retrieve an existing Ethereum account using private key.
   *
   * This method will return a future which completes with an [Account] object.
   * The Ethereum address and private key can get from [Account] object.
   */
  static Future<Account> retrieveAccount(String privateKey) async {
    return Account.retrieve(privateKey);
  }

  /**
   * Convert hexdecimals string to an [Address] object.
   *
   * If the input string is an invalid Ethereum address, this method will throw an [ArgumentError].
   */
  static Address hexToAddress(String address) {
    return Address.fromHex(address);
  }

  /**
   * Check if the input string is a valid Ethereum address.
   */
  static bool isValidAddress(String address) {
    try {
      EthereumAddress.fromHex(address);
      return true;
    } catch (e) {
      return false;
    }
  }

  /**
   * Query the ETH balance of the input address.
   *
   * This method will return a future which completes a [BigInt] in unit wei.
   */
  Future<BigInt> balanceOf(Address address) async {
    var balance =
    await this.web3.getBalance(EthereumAddress.fromHex(address as String));
    return balance.getInWei;
  }

  /**
   * Transfer ETH
   */
  Future<void> transfer(
      Address recipient, BigInt amount, Account sender) async {
    var txHash = await this.web3.sendTransaction(
        sender._credentials,
        Transaction(
          to: recipient._ethereumAddress,
          value: EtherAmount.inWei(amount),
        ));
    // wait until the transaction is confirmed
    await this.asyncTransaction(txHash, _confirmationRequirement);
  }

  /**
   * Get [TFC] object, which represents TFC ERC20 smart contract.
   *
   * The input is the Ethereum [Address] of TFC ERC20 contract.
   */
  TFC tfc(Address tfcAddress) => TFC._(this.web3, tfcAddress);

  /**
   * Get [Manager] object, which represents TFCManger smart contract.
   *
   * The input is the Ethereum [Address] of TFCManager contract.
   */
  Manager manager(Address managerAddress) =>
      Manager._(this.web3, managerAddress);

  /**
   * Get current Ethereum transaction confirmation requirement
   */
  int get confirmationRequirement => _confirmationRequirement;

  /**
   * Set Ethereum transaction confirmation requirement
   */
  set confirmationRequirement(int confirmationRequirement) {
    _confirmationRequirement = confirmationRequirement;
  }
}
