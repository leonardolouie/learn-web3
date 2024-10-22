(async() =>{ 

  const address = "0xE5363f1b12023d5A402D551362746f684B5c6532";
  const abiArray = [
        {
            "inputs": [],
            "name": "myUint",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "uint256",
                    "name": "_uint",
                    "type": "uint256"
                }
            ],
            "name": "setMyUint",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ]
  const contractInstance = new web3.eth.Contract(abiArray, address);
  let accounts = await web3.eth.getAccounts();
  console.log("leo");
  console.log(await contractInstance.methods.myUint().call());
  const response = await contractInstance.methods.setMyUint(567).send({from: accounts[0]});
  console.log(response);
})()