[OpenZeppelin Ethernaut](https://github.com/OpenZeppelin/ethernaut) but with the front end stripped out and all tests left blank for you to practice breaking Solidity.

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
