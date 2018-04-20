# Lottery smart contract using ethereum.

A simple lottery contract which enables a user to deploy the contract who then becomes the manager.
Players can then enter into the lottery with some minimum amount of ether. The manager can pick the winner
who gets all the ether that is present in the contract.

## How to use

- Clone the lottery-contract repository
- run `yarn` or `yarn install`
- To test the contract run `yarn test`
- Edit _provider_ in the deploy.js file. Paste your metamask mnemomnic and infura link. (Use local host address to deploy it from your machine)
- Also look at __lottery-server__ repo for the front end to interact with the contract. 
