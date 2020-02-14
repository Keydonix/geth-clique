FROM ethereum/client-go:v1.9.10

RUN apk update && apk add bash curl coreutils jq

COPY genesis.json /geth/genesis.json
ADD dev-key.json /geth/keys/dev-key.json
RUN echo "" > /geth/keys/dev-key-password.txt

RUN geth --nodiscover --datadir "/geth/chain" --keystore "/geth/keys" init "/geth/genesis.json"

WORKDIR /
COPY start.sh /start.sh
RUN chmod 555 /start.sh
ENTRYPOINT [ "/start.sh" ]

# docker image build --tag keydonix/geth-clique .
# docker container run --rm -it -p 8545:8545 --name keydonix/geth-clique geth-clique

# To connect in a separate terminal: geth attach http://127.0.0.1:8545
