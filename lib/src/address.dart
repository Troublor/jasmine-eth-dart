part of sdk;

/// This class represents an Ethereum address.
class Address {
  EthereumAddress _ethereumAddress;

  /// Construct an [Address] object using hexdecimals string.
  ///
  /// If the input is not a valid Ethereum address, [ArgumentError] will be thrown.
  Address.fromHex(String hexAddress) {
    this._ethereumAddress = EthereumAddress.fromHex(hexAddress);
  }

  Address._fromEthereumAddress(this._ethereumAddress);

  /// Get the hexdecimals string of this address.
  String get hex => this._ethereumAddress.hexEip55;
}
