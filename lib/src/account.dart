part of sdk;

/// This class represents an Ethereum account.
class Account {
  final EthereumAddress _address;
  final EthPrivateKey _credentials;

  Account(this._credentials, this._address);

  /// Retrieve an existing Ethereum Account from private key
  static Future<Account> retrieve(String privateKey) async {
    var credentials = EthPrivateKey.fromHex(privateKey);
    var address = await credentials.extractAddress();
    return Account(credentials, address);
  }

  /// Create a new Ethereum Account
  static Future<Account> create() async {
    var rng = new Random.secure();
    var key = generateNewPrivateKey(rng);
    var ethKey = EthPrivateKey(intToBytes(key));
    var privateKey = bytesToHex(ethKey.privateKey);
    return Account.retrieve(privateKey);
  }

  /// Get Ethereum address of the account.
  Address get address => Address.fromHex(this._address.hexEip55);

  /// Get the private key (represented in hexdecimals) of this account.
  String get privateKey => "0x" + bytesToHex(this._credentials.privateKey);
}
