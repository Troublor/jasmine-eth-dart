part of sdk;

mixin _provider {
  Web3Client web3;

  Future<TransactionReceipt> asyncTransaction(
      String transactionHash, int confirmationRequirement) async {
    // check current receipt
    Future<bool> checkReceipt(TransactionReceipt receipt) async {
      var currentNumber = await this.web3.getBlockNumber();
      var confirmationCount = currentNumber - receipt.blockNumber.blockNum;
      if (confirmationCount >= confirmationRequirement) {
        return false;
      }
      return true;
    }

    var completer = new Completer<TransactionReceipt>();

    // subscribe to new blocks
    StreamSubscription subscribe;
    subscribe = this.web3.addedBlocks().listen((String blockHash) async {
      var receipt = await this.web3.getTransactionReceipt(transactionHash);
      if (receipt != null) {
        var waitForMoreBlocks = await checkReceipt(receipt);
        if (!waitForMoreBlocks) {
          subscribe.cancel();
          completer.complete(receipt);
        }
      }
    });

    // check if already confirmed
    var receipt = await this.web3.getTransactionReceipt(transactionHash);
    if (receipt != null) {
      var waitForMoreBlocks = await checkReceipt(receipt);
      if (!waitForMoreBlocks) {
        subscribe.cancel();
        completer.complete(receipt);
      }
    }

    return completer.future;
  }
}
