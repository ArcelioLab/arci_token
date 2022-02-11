CONTRACT=./src/arcitoken

all: $(CONTRACT).wasm $(CONTRACT).abi

%.wasm: %.cpp ./include/arcitoken.hpp
	eosio-cpp -I. -o $@ $<

%.abi: %.cpp
	eosio-abigen -contract=$(CONTRACT) --output=$@ $<

clean:
	rm -f $(CONTRACT).wasm $(CONTRACT).abi
