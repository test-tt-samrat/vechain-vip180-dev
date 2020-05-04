VIP180 All-in-One Deployment Tool - developer version
====


## Overview

This is a command line based and one-click type of application that is used to generate and deploy a standard BIP180 token smart contract. This is mainly used by developers for development and testing purpose.

Granted by VeChain, Morpheus Labs has published this utility as an application in Application Library of Morpheus Labs BPaaS (ML BPaaS) https://bps.morpheuslabs.io.

There are options to run this tool at the moment.

1. Run the application in your local environment
2. Run the application on ML BPaaS

Option 1 - Run the application in your local environment. In this case, all the required software need to be installed first, such as source code editor (e.g. VSCode), node.js, npm, truffle. This option may be useful, if the user just want to run the appliation to deploy the token smart contracts and not interested in knowing the details of the application, and provided the user is willing to setup a local environment to run the application.

Option 2 - Run the application on ML BPaaS - In this case, all the required software are pre-installed. You can quickly explore and test the application using VeChain Solo node on the platform with all ready-to-use tools and network nodes, or test on VeChain testnet before you run the application to deploy the token smart contracts to the VeChain mainnet. This option is recommended, if users want to focus on the application or even want to customize the application without bothering too much on the environment setup.

## Steps to launch the utility on ML BPaaS

Step 1 - Download the VIP180 token generator web version from Application Library

Step 2 - Deploy the application from my repository to create a new workspace in CDE

Step 3 - Start the newly created workspace

Step 4 - Open the workspace to launch the CDE

Step 5 - Open a terminal and cd to the application directory to run the commands

Step 6 - Install program dependencies

```
npm install
```

Step 7 - Start the application

```
npm run dev
```

The list of the paraneters to be provided when running the application from the command line:

+ endpoint: The HTTP provider for VeChainThor network
+ master private key: The signer to deploy the contract
+ initialHolder: The initial VIP180 token holders
+ name: The name of token
+ symbol: The symbol of token
+ decimals: The number of decimals the token uses 

The following is a screenshot of running the application from command line.

# Screenshot

![deploy](images/deploy.jpg)


