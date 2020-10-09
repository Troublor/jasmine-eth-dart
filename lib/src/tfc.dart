part of sdk;

/**
 * This class represents the TFC ERC20 token smart contract.
 */
class TFC with _provider {
  /**
   * ABI of the contract.
   */
  static final String abi = "";

  /**
   * The Ethereum address of TFC ERC20 smart contract.
   */
  final Address address;

  DeployedContract _contract;

  TFC._(Web3Client web3, this.address) {
    this.web3 = web3;
    this._contract = DeployedContract(ContractAbi.fromJson(TFC.abi, "TFCToken"),
        this.address._ethereumAddress);
  }

  /**
   * Query the TFC balance of an [Address].
   *
   * This method will return a future which completes a [BigInt] in smallest unit of TFC ERC20 token.
   */
  Future<BigInt> balanceOf(Address address) async {
    var balanceOfFunc = this._contract.function("balanceOf");
    var balance = await this.web3.call(
        contract: this._contract,
        function: balanceOfFunc,
        params: [address._ethereumAddress]);
    // TODO check balance.first is BigInt or not
    return balance.first;
  }
}
