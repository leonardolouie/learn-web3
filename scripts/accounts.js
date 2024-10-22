


(async() => { 
 let accounts = await web3.eth.getAccounts();
 console.log(accounts);
 let accountBalance = await web3.eth.getBalance(accounts[0]);
 console.log(accountBalance);
 console.log(await web3.utils.fromWei(accountBalance, "ether"), 'ETH value');
})()