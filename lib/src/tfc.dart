part of sdk;

/// This class represents the TFC ERC20 token smart contract.
class TFC with _provider {
  /// bytecode of the contract
  static final String bytecode =
      "0x60806040523480156200001157600080fd5b506040516200327b3803806200327b833981810160405260408110156200003757600080fd5b81019080805160405193929190846401000000008211156200005857600080fd5b838201915060208201858111156200006f57600080fd5b82518660208202830111640100000000821117156200008d57600080fd5b8083526020830192505050908051906020019060200280838360005b83811015620000c6578082015181840152602081019050620000a9565b5050505090500160405260200180516040519392919084640100000000821115620000f057600080fd5b838201915060208201858111156200010757600080fd5b82518660208202830111640100000000821117156200012557600080fd5b8083526020830192505050908051906020019060200280838360005b838110156200015e57808201518184015260208101905062000141565b505050509050016040525050506040518060400160405280600881526020017f544643546f6b656e0000000000000000000000000000000000000000000000008152506040518060400160405280600381526020017f544643000000000000000000000000000000000000000000000000000000000081525081818160049080519060200190620001f192919062000882565b5080600590805190602001906200020a92919062000882565b506012600660006101000a81548160ff021916908360ff16021790555050506000600660016101000a81548160ff021916908315150217905550620002686000801b6200025c620003c560201b60201c565b620003cd60201b60201c565b620002a97f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a66200029d620003c560201b60201c565b620003cd60201b60201c565b620002ea7f65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a620002de620003c560201b60201c565b620003cd60201b60201c565b5050805182511462000348576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526040815260200180620032116040913960400191505060405180910390fd5b60005b8251811015620003bc5760008282815181106200036457fe5b60200260200101511115620003ae57620003ad8382815181106200038457fe5b60200260200101518383815181106200039957fe5b6020026020010151620003e360201b60201c565b5b80806001019150506200034b565b50505062000928565b600033905090565b620003df8282620005c360201b60201c565b5050565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff16141562000487576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601f8152602001807f45524332303a206d696e7420746f20746865207a65726f20616464726573730081525060200191505060405180910390fd5b6200049b600083836200066660201b60201c565b620004b7816003546200068360201b620015441790919060201c565b6003819055506200051681600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020546200068360201b620015441790919060201c565b600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff16600073ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a35050565b620005f1816000808581526020019081526020016000206000016200070c60201b620015cc1790919060201c565b15620006625762000607620003c560201b60201c565b73ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff16837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45b5050565b6200067e8383836200074460201b620015fc1760201c565b505050565b60008082840190508381101562000702576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601b8152602001807f536166654d6174683a206164646974696f6e206f766572666c6f77000000000081525060200191505060405180910390fd5b8091505092915050565b60006200073c836000018373ffffffffffffffffffffffffffffffffffffffff1660001b620007c960201b60201c565b905092915050565b6200075c8383836200084360201b6200166a1760201c565b6200076c6200084860201b60201c565b15620007c4576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602a81526020018062003251602a913960400191505060405180910390fd5b505050565b6000620007dd83836200085f60201b60201c565b620008385782600001829080600181540180825580915050600190039060005260206000200160009091909190915055826000018054905083600101600084815260200190815260200160002081905550600190506200083d565b600090505b92915050565b505050565b6000600660019054906101000a900460ff16905090565b600080836001016000848152602001908152602001600020541415905092915050565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10620008c557805160ff1916838001178555620008f6565b82800160010185558215620008f6579182015b82811115620008f5578251825591602001919060010190620008d8565b5b50905062000905919062000909565b5090565b5b80821115620009245760008160009055506001016200090a565b5090565b6128d980620009386000396000f3fe608060405234801561001057600080fd5b50600436106101c45760003560e01c806370a08231116100f9578063a457c2d711610097578063d539139311610071578063d5391393146109de578063d547741f146109fc578063dd62ed3e14610a4a578063e63ab1e914610ac2576101c4565b8063a457c2d7146108d4578063a9059cbb14610938578063ca15c8731461099c576101c4565b80639010d07c116100d35780639010d07c1461076d57806391d14854146107cf57806395d89b4114610833578063a217fddf146108b6576101c4565b806370a08231146106bd57806379cc6790146107155780638456cb5914610763576101c4565b806336568abe1161016657806340c10f191161014057806340c10f19146104bf57806342966c681461050d578063436ff61b1461053b5780635c975abb1461069d576101c4565b806336568abe1461040357806339509351146104515780633f4ba83a146104b5576101c4565b806323b872dd116101a257806323b872dd146102ce578063248a9ca3146103525780632f2ff15d14610394578063313ce567146103e2576101c4565b806306fdde03146101c9578063095ea7b31461024c57806318160ddd146102b0575b600080fd5b6101d1610ae0565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156102115780820151818401526020810190506101f6565b50505050905090810190601f16801561023e5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b6102986004803603604081101561026257600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610b82565b60405180821515815260200191505060405180910390f35b6102b8610ba0565b6040518082815260200191505060405180910390f35b61033a600480360360608110156102e457600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610baa565b60405180821515815260200191505060405180910390f35b61037e6004803603602081101561036857600080fd5b8101908080359060200190929190505050610c83565b6040518082815260200191505060405180910390f35b6103e0600480360360408110156103aa57600080fd5b8101908080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610ca2565b005b6103ea610d2b565b604051808260ff16815260200191505060405180910390f35b61044f6004803603604081101561041957600080fd5b8101908080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610d42565b005b61049d6004803603604081101561046757600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610ddb565b60405180821515815260200191505060405180910390f35b6104bd610e8e565b005b61050b600480360360408110156104d557600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610f1e565b005b6105396004803603602081101561052357600080fd5b8101908080359060200190929190505050610fb2565b005b6106856004803603604081101561055157600080fd5b810190808035906020019064010000000081111561056e57600080fd5b82018360208201111561058057600080fd5b803590602001918460208302840111640100000000831117156105a257600080fd5b919080806020026020016040519081016040528093929190818152602001838360200280828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019064010000000081111561060257600080fd5b82018360208201111561061457600080fd5b8035906020019184602083028401116401000000008311171561063657600080fd5b919080806020026020016040519081016040528093929190818152602001838360200280828437600081840152601f19601f820116905080830192505050505050509192919290505050610fc6565b60405180821515815260200191505060405180910390f35b6106a561107e565b60405180821515815260200191505060405180910390f35b6106ff600480360360208110156106d357600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050611095565b6040518082815260200191505060405180910390f35b6107616004803603604081101561072b57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506110de565b005b61076b611140565b005b6107a36004803603604081101561078357600080fd5b8101908080359060200190929190803590602001909291905050506111d0565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b61081b600480360360408110156107e557600080fd5b8101908080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050611201565b60405180821515815260200191505060405180910390f35b61083b611232565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561087b578082015181840152602081019050610860565b50505050905090810190601f1680156108a85780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b6108be6112d4565b6040518082815260200191505060405180910390f35b610920600480360360408110156108ea57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506112db565b60405180821515815260200191505060405180910390f35b6109846004803603604081101561094e57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506113a8565b60405180821515815260200191505060405180910390f35b6109c8600480360360208110156109b257600080fd5b81019080803590602001909291905050506113c6565b6040518082815260200191505060405180910390f35b6109e66113ec565b6040518082815260200191505060405180910390f35b610a4860048036036040811015610a1257600080fd5b8101908080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050611410565b005b610aac60048036036040811015610a6057600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050611499565b6040518082815260200191505060405180910390f35b610aca611520565b6040518082815260200191505060405180910390f35b606060048054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015610b785780601f10610b4d57610100808354040283529160200191610b78565b820191906000526020600020905b815481529060010190602001808311610b5b57829003601f168201915b5050505050905090565b6000610b96610b8f61166f565b8484611677565b6001905092915050565b6000600354905090565b6000610bb784848461186e565b610c7884610bc361166f565b610c738560405180606001604052806028815260200161270360289139600260008b73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000610c2961166f565b73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054611b339092919063ffffffff16565b611677565b600190509392505050565b6000806000838152602001908152602001600020600201549050919050565b610cc860008084815260200190815260200160002060020154610cc361166f565b611201565b610d1d576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602f8152602001806125cd602f913960400191505060405180910390fd5b610d278282611bf3565b5050565b6000600660009054906101000a900460ff16905090565b610d4a61166f565b73ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1614610dcd576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602f81526020018061284b602f913960400191505060405180910390fd5b610dd78282611c86565b5050565b6000610e84610de861166f565b84610e7f8560026000610df961166f565b73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461154490919063ffffffff16565b611677565b6001905092915050565b610ebf7f65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a610eba61166f565b611201565b610f14576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252603981526020018061261e6039913960400191505060405180910390fd5b610f1c611d19565b565b610f4f7f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6610f4a61166f565b611201565b610fa4576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252603681526020018061272b6036913960400191505060405180910390fd5b610fae8282611e0c565b5050565b610fc3610fbd61166f565b82611fd5565b50565b60008151835114611022576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260348152602001806126796034913960400191505060405180910390fd5b60005b83518110156110735761106661103961166f565b85838151811061104557fe5b602002602001015185848151811061105957fe5b602002602001015161186e565b8080600101915050611025565b506001905092915050565b6000600660019054906101000a900460ff16905090565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600061111d826040518060600160405280602481526020016127616024913961110e8661110961166f565b611499565b611b339092919063ffffffff16565b90506111318361112b61166f565b83611677565b61113b8383611fd5565b505050565b6111717f65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a61116c61166f565b611201565b6111c6576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260378152602001806127ef6037913960400191505060405180910390fd5b6111ce61219b565b565b60006111f98260008086815260200190815260200160002060000161228f90919063ffffffff16565b905092915050565b600061122a826000808681526020019081526020016000206000016122a990919063ffffffff16565b905092915050565b606060058054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156112ca5780601f1061129f576101008083540402835291602001916112ca565b820191906000526020600020905b8154815290600101906020018083116112ad57829003601f168201915b5050505050905090565b6000801b81565b600061139e6112e861166f565b8461139985604051806060016040528060258152602001612826602591396002600061131261166f565b73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008a73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054611b339092919063ffffffff16565b611677565b6001905092915050565b60006113bc6113b561166f565b848461186e565b6001905092915050565b60006113e56000808481526020019081526020016000206000016122d9565b9050919050565b7f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a681565b6114366000808481526020019081526020016000206002015461143161166f565b611201565b61148b576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260308152602001806126d36030913960400191505060405180910390fd5b6114958282611c86565b5050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054905092915050565b7f65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a81565b6000808284019050838110156115c2576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601b8152602001807f536166654d6174683a206164646974696f6e206f766572666c6f77000000000081525060200191505060405180910390fd5b8091505092915050565b60006115f4836000018373ffffffffffffffffffffffffffffffffffffffff1660001b6122ee565b905092915050565b61160783838361166a565b61160f61107e565b15611665576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602a81526020018061287a602a913960400191505060405180910390fd5b505050565b505050565b600033905090565b600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff1614156116fd576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260248152602001806127cb6024913960400191505060405180910390fd5b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415611783576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260228152602001806126576022913960400191505060405180910390fd5b80600260008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925836040518082815260200191505060405180910390a3505050565b600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff1614156118f4576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260258152602001806127a66025913960400191505060405180910390fd5b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff16141561197a576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260238152602001806125aa6023913960400191505060405180910390fd5b61198583838361235e565b6119f1816040518060600160405280602681526020016126ad60269139600160008773ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054611b339092919063ffffffff16565b600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550611a8681600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461154490919063ffffffff16565b600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a3505050565b6000838311158290611be0576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825283818151815260200191508051906020019080838360005b83811015611ba5578082015181840152602081019050611b8a565b50505050905090810190601f168015611bd25780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b5060008385039050809150509392505050565b611c1a816000808581526020019081526020016000206000016115cc90919063ffffffff16565b15611c8257611c2761166f565b73ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff16837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45b5050565b611cad8160008085815260200190815260200160002060000161236e90919063ffffffff16565b15611d1557611cba61166f565b73ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff16837ff6391f5c32d9c69d2a47ea670b442974b53935d1edc7fd64eb21e047a839171b60405160405180910390a45b5050565b600660019054906101000a900460ff16611d9b576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260148152602001807f5061757361626c653a206e6f742070617573656400000000000000000000000081525060200191505060405180910390fd5b6000600660016101000a81548160ff0219169083151502179055507f5db9ee0a495bf2e6ff9c91a7834c1ba4fdd244a5e8aa4e537bd38aeae4b073aa611ddf61166f565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390a1565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415611eaf576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601f8152602001807f45524332303a206d696e7420746f20746865207a65726f20616464726573730081525060200191505060405180910390fd5b611ebb6000838361235e565b611ed08160035461154490919063ffffffff16565b600381905550611f2881600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461154490919063ffffffff16565b600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff16600073ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a35050565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff16141561205b576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260218152602001806127856021913960400191505060405180910390fd5b6120678260008361235e565b6120d3816040518060600160405280602281526020016125fc60229139600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054611b339092919063ffffffff16565b600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000208190555061212b8160035461239e90919063ffffffff16565b600381905550600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a35050565b600660019054906101000a900460ff161561221e576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260108152602001807f5061757361626c653a207061757365640000000000000000000000000000000081525060200191505060405180910390fd5b6001600660016101000a81548160ff0219169083151502179055507f62e78cea01bee320cd4e420270b5ea74000d11b0c9f74754ebdbfc544b05a25861226261166f565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390a1565b600061229e83600001836123e8565b60001c905092915050565b60006122d1836000018373ffffffffffffffffffffffffffffffffffffffff1660001b61246b565b905092915050565b60006122e78260000161248e565b9050919050565b60006122fa838361246b565b612353578260000182908060018154018082558091505060019003906000526020600020016000909190919091505582600001805490508360010160008481526020019081526020016000208190555060019050612358565b600090505b92915050565b6123698383836115fc565b505050565b6000612396836000018373ffffffffffffffffffffffffffffffffffffffff1660001b61249f565b905092915050565b60006123e083836040518060400160405280601e81526020017f536166654d6174683a207375627472616374696f6e206f766572666c6f770000815250611b33565b905092915050565b600081836000018054905011612449576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260228152602001806125886022913960400191505060405180910390fd5b82600001828154811061245857fe5b9060005260206000200154905092915050565b600080836001016000848152602001908152602001600020541415905092915050565b600081600001805490509050919050565b6000808360010160008481526020019081526020016000205490506000811461257b57600060018203905060006001866000018054905003905060008660000182815481106124ea57fe5b906000526020600020015490508087600001848154811061250757fe5b906000526020600020018190555060018301876001016000838152602001908152602001600020819055508660000180548061253f57fe5b60019003818190600052602060002001600090559055866001016000878152602001908152602001600020600090556001945050505050612581565b60009150505b9291505056fe456e756d657261626c655365743a20696e646578206f7574206f6620626f756e647345524332303a207472616e7366657220746f20746865207a65726f2061646472657373416363657373436f6e74726f6c3a2073656e646572206d75737420626520616e2061646d696e20746f206772616e7445524332303a206275726e20616d6f756e7420657863656564732062616c616e636545524332305072657365744d696e7465725061757365723a206d75737420686176652070617573657220726f6c6520746f20756e706175736545524332303a20617070726f766520746f20746865207a65726f20616464726573736172726179206c656e677468206f6620726563697069656e747320616e6420616d6f756e7473206d75737420626520657175616c45524332303a207472616e7366657220616d6f756e7420657863656564732062616c616e6365416363657373436f6e74726f6c3a2073656e646572206d75737420626520616e2061646d696e20746f207265766f6b6545524332303a207472616e7366657220616d6f756e74206578636565647320616c6c6f77616e636545524332305072657365744d696e7465725061757365723a206d7573742068617665206d696e74657220726f6c6520746f206d696e7445524332303a206275726e20616d6f756e74206578636565647320616c6c6f77616e636545524332303a206275726e2066726f6d20746865207a65726f206164647265737345524332303a207472616e736665722066726f6d20746865207a65726f206164647265737345524332303a20617070726f76652066726f6d20746865207a65726f206164647265737345524332305072657365744d696e7465725061757365723a206d75737420686176652070617573657220726f6c6520746f20706175736545524332303a2064656372656173656420616c6c6f77616e63652062656c6f77207a65726f416363657373436f6e74726f6c3a2063616e206f6e6c792072656e6f756e636520726f6c657320666f722073656c6645524332305061757361626c653a20746f6b656e207472616e73666572207768696c6520706175736564a2646970667358221220bf1e5797642da9f8c28af1255ce434ad67a3200447a136f11436a8f7ee38aae464736f6c634300060c00336172726179206c656e677468206f6620696e697469616c486f6c6465727320616e6420696e697469616c537570706c696573206d75737420626520657175616c45524332305061757361626c653a20746f6b656e207472616e73666572207768696c6520706175736564";

  /// ABI of the contract.
  static final String abi =
      '[{"inputs":[{"internalType":"address[]","name":"initialHolders","type":"address[]"},{"internalType":"uint256[]","name":"initialSupplies","type":"uint256[]"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Paused","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"previousAdminRole","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"newAdminRole","type":"bytes32"}],"name":"RoleAdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleRevoked","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Unpaused","type":"event"},{"inputs":[],"name":"DEFAULT_ADMIN_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"MINTER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PAUSER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"spender","type":"address"}],"name":"allowance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"approve","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"account","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"burn","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"account","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"burnFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"decimals","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"subtractedValue","type":"uint256"}],"name":"decreaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleAdmin","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"uint256","name":"index","type":"uint256"}],"name":"getRoleMember","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleMemberCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"grantRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"hasRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"addedValue","type":"uint256"}],"name":"increaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"mint","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address[]","name":"tos","type":"address[]"},{"internalType":"uint256[]","name":"amounts","type":"uint256[]"}],"name":"one2manyTransfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"pause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"paused","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"renounceRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"revokeRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"transfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"sender","type":"address"},{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"transferFrom","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"unpause","outputs":[],"stateMutability":"nonpayable","type":"function"}]';

  /// The Ethereum address of TFC ERC20 smart contract.
  final Address address;

  SharedSettings _shared;
  DeployedContract _contract;

  TFC._(Web3Client web3, this.address, this._shared) {
    this.web3 = web3;
    this._contract = DeployedContract(ContractAbi.fromJson(TFC.abi, "TFCToken"),
        this.address._ethereumAddress);
  }

  /// Query the TFC balance of an [Address].
  ///
  /// This method will return a future which completes a [BigInt] in smallest unit of TFC ERC20 token.
  Future<BigInt> balanceOf(Address address) async {
    var balanceOfFunc = this._contract.function("balanceOf");
    var balance = await this.web3.call(
        contract: this._contract,
        function: balanceOfFunc,
        params: [address._ethereumAddress]);
    return balance.first;
  }

  Future<void> transfer(
      Address recipient, BigInt amount, Account sender) async {
    var transferFunc = this._contract.function("transfer");
    var txHash = await this.web3.sendTransaction(
        sender._credentials,
        Transaction.callContract(
          contract: this._contract,
          function: transferFunc,
          parameters: [recipient._ethereumAddress, amount],
          nonce: await this.web3.getTransactionCount(sender._address,
              atBlock: BlockNum.pending()),
        ),
        fetchChainIdFromNetworkId: true);
    // wait until the transaction is confirmed
    await this.asyncTransaction(txHash, this._shared.confirmationNumber);
  }
}
