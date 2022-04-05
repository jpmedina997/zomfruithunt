# this script is used to format the source code, and to compile the contract, then deploy it to the local chain

clang-format-10 -i contracts/game/include/*.hpp
clang-format-10 -i contracts/game/src/*.cpp

cd contracts/game

eosio-cpp --abigen -I include -o zomfruithunt.wasm src/zomfruithunters.cpp

if [ -f pumpkinlands.wasm ]; then
    # deploy the compiled contract
    cleos set contract zomfruithunt $PWD zomfruithunt.wasm zomfruithunt.abi -p zomfruithunt@active

    # check for the ram usage
    cleos get account zomfruithunt | grep quota
    cleos get account zomfruithunt -j | grep ram_usage
fi;

