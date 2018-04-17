const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
    'unusual donor select sell raccoon office chapter miracle damage razor success become',
    'https://rinkeby.infura.io/mtFwL2yHZw0Vg9DawLnw' 
);

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log('Attemoting to deploy from ',accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({
            data: bytecode,
        })
        .send({
            gas: '1000000',
            from: accounts[0]
        })
    
        console.log('Contract deployed to ', result.options.address);
};
deploy();