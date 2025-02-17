[OpenZeppelin Ethernaut](https://github.com/OpenZeppelin/ethernaut) but with the front end stripped out and all tests left blank to practice breaking Solidity contracts.

# Setup

After installing [Foundry](https://book.getfoundry.sh/getting-started/installation), you will need to install both an older and a newer version of openzeppelin contracts:

1. `forge install openzeppelin-contracts-06=OpenZeppelin/openzeppelin-contracts@v3.3.0 --no-commit`
2. `forge install openzeppelin-contracts-08=OpenZeppelin/openzeppelin-contracts@v4.4.1 --no-commit`
3. `forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit`
4. `forge install foundry-rs/forge-std --no-commit`

>Don't change the versions above as there are differences which will cause build to fail.

Compile everything with `forge build`

# Additional Contracts

Some challenges will require you to write a new contract to help with your attack (e.g. Telephone). Write these additional contracts in `src/attacks/<Challenge Name>Attack.sol`.

# Testing

>Note on tests: Code contains additional sanity-check type of tests which you are not supposed to interact with so that is why I suggest using the `--mt testSolve` option.

## Test Contract Specific Problems

I suggest testing problems as you go. So, for example, if you are working on Fallback, you would test your code with below command:

`forge test --mt testSolve --mc Fallback`

Or more generally:

`forge test --mt testSolve --mc <contract_name_here>`

## Test All Problems

Run below to test your solution to all Ethernaut problems:

`forge test --mt testSolve`
