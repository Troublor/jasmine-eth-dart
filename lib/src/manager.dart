part of sdk;

/**
 * This class represents the TFCManager smart contract.
 */
class Manager with _provider {
  /**
   * ABI of the contract.
   */
  static final abi = '';

  /**
   * The Ethereum address of TFC ERC20 smart contract.
   */
  final Address address;

  DeployedContract _contract;

  Manager._(Web3Client web3, this.address) {
    this.web3 = web3;
    this._contract = DeployedContract(
        ContractAbi.fromJson(Manager.abi, "TFCManager"),
        this.address._ethereumAddress);
  }

  /**
   * Claim TFC ERC20 token, which is logically withdraw TFC from TFC-db to TFC-erc20.
   *
   * This method takes the [BigInt] amount of token to claim, an unused nonce and a signature signed by administrator.
   * claimer [Account] is the user who want to claim TFC token on Ethereum.
   */
  Future<void> claimTFC(
      BigInt amount, BigInt nonce, String signature, Account claimer) async {
    var claimTFCFunc = this._contract.function("claimTFC");
    var txHash = await this.web3.sendTransaction(
        claimer._credentials,
        Transaction.callContract(
          contract: this._contract,
          function: claimTFCFunc,
          parameters: [amount, nonce, signature],
        ));
    return this.asyncTransaction(txHash, _confirmationRequirement);
  }
}
