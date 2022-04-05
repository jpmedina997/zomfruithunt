# this script is used to deploy the compiled wasm to the local chain

cd contracts/game

if [ ! -f zomfruithunt.wasm ]; then
    echo "no wasm file found"
    exit 1
fi;

# deploy the compiled contract
cleos set contract zomfruithunt $PWD zomfruithunt.wasm zomfruithunt.abi -p zomfruithunt@active

# check for the ram usage
cleos get account zomfruithunt | grep quota
cleos get account zomfruithunt -j | grep ram_usage
