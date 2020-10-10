part of sdk;

class MockEthereum {
  Process _ganacheProcess;
  int _port;

  Future<void> start(
      {int port = 8545,
      int blockTime = -1,
      List<String> ganacheOptions = null}) async {
    if (ganacheOptions == null) {
      ganacheOptions = new List<String>();
    }
    ganacheOptions.add("--port=$port");
    if (blockTime > 0) {
      ganacheOptions.add("--blockTime=$blockTime");
    }
    // add predefined accounts
    for (var key in _predefinedPrivateKeys) {
      ganacheOptions.add(
          "--account=$key,0x56BC75E2D63100000"); // 100 eth for each account
    }
    this._ganacheProcess = await Process.start('ganache-cli', ganacheOptions);
    this._port = port;
    this._ganacheProcess.exitCode.then((value) {
      if (value != 0) {
        throw new Exception("ganache exit with code $value");
      }
    });
    sleep(Duration(seconds: 3));
  }

  Future<int> stop() async {
    if (this._ganacheProcess == null) {
      return Future.value(0);
    }
    sleep(Duration(seconds: 1));
    this._ganacheProcess.kill(ProcessSignal.sigint);
    var exitCode = this._ganacheProcess.exitCode;
    this._ganacheProcess = null;
    this._port = null;
    return exitCode;
  }

  String get endpoint => "http://localhost:${this._port}";

  Future<List<Account>> predefinedAccounts() async {
    return await Future.wait(
        _predefinedPrivateKeys.map((key) => Account.retrieve(key)));
  }

  Future<void> mineBlock() async {
    var data = {
      "id": 1337,
      "jsonrpc": "2.0",
      "method": "evm_mine",
      "params": [1231006505000]
    };
    var response =
        await post("http://localhost:8545", body: jsonEncode(data), headers: {
      'Content-Type': "application/json",
    });
    if (response.statusCode != 200) {
      throw Future.error("http status code is not 200");
    }
    var result = jsonDecode(response.body);
    if (result['error'] != null) {
      throw Future.error(result['error']);
    }
  }
}

// void main() async {
//   var mockEth = new MockEthereum();
//   await mockEth.start();
//   sleep(Duration(seconds: 10));
//   var code = await mockEth.stop();
//   print(code);
// }
