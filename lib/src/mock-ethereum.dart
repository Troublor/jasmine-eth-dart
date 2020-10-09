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
    sleep(Duration(seconds: 3));
  }

  Future<int> stop() async {
    if (this._ganacheProcess == null) {
      return Future.value(0);
    }
    this._ganacheProcess.kill(ProcessSignal.sigint);
    var exitCode = this._ganacheProcess.exitCode;
    this._ganacheProcess = null;
    this._port = null;
    return exitCode;
  }

  String get endpoint => "http://localhost:${this._port}";
}

// void main() async {
//   var mockEth = new MockEthereum();
//   await mockEth.start();
//   sleep(Duration(seconds: 10));
//   var code = await mockEth.stop();
//   print(code);
// }
