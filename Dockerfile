FROM ethereum/client-go:v1.8.10

RUN apk update \
    && apk add bash curl coreutils

COPY genesis.json /geth/genesis.json
COPY password.txt /geth/password.txt
ADD keys /geth/keys

WORKDIR /
COPY ./common_start.sh /common_start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT [ "/start.sh" ]

# docker image build --tag keydonix/geth-poa .
# docker container run --rm -it -p 8545:8545 --name keydonix/geth-poa geth-poa

# To connect in a separate terminal: geth attach http://127.0.0.1:8545
# To persist the chain, volume mount over /geth/chain, such as `-v $HOME/.geth-chain:/geth/chain`
