project(zomfruithunt)

set(EOSIO_WASM_OLD_BEHAVIOR "Off")
find_package(eosio.cdt)

add_contract( zomfruithunt zomfruithunt zomfruithunt.cpp )
target_include_directories( zomfruithunt PUBLIC ${CMAKE_SOURCE_DIR}/../include )
target_ricardian_directory( zomfruithunt ${CMAKE_SOURCE_DIR}/../ricardian )