#!/bin/bash
exec geth \
	--allow-insecure-unlock
	--networkid "$(cat /geth/genesis.json | jq '.config.chainId')" \
	--datadir "/geth/chain" \
	--keystore "/geth/keys" \
	--password "/geth/keys/dev-key-password.txt" \
	--unlock "0x913da4198e6be1d5f5e4a40d0667f70c0b5430eb" \
	--verbosity ${GETH_VERBOSITY:-2} --mine \
	--ws --wsapi admin,db,debug,eth,miner,net,personal,shh,txpool,web3 --wsaddr 0.0.0.0 --wsport 8546 --wsorigins '*' \
	--rpc --rpcapi admin,db,debug,eth,miner,net,personal,shh,txpool,web3 --rpcaddr 0.0.0.0 --rpcport 8545 --rpccorsdomain '*' --rpcvhosts '*' \
	--nodiscover \
	--targetgaslimit 6500000
