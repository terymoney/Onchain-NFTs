# =========================================================
# Teri On-Chain NFT Project — Makefile
# Author: Maria Terese Ezeobi
# Stack: Solidity • Foundry • EVM + zkSync
# =========================================================

-include .env

.PHONY: all clean install update build test snapshot format anvil \
        deployRobot mintRobot deployMood mintMood flipMood \
        zkbuild zktest zkdeploy help

# =========================================================
# Hardcoded Local Anvil Config (as requested)
# =========================================================

ANVIL_RPC_URL := http://127.0.0.1:8545
ANVIL_PRIVATE_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

ZKSYNC_LOCAL_RPC := http://127.0.0.1:8011
ZKSYNC_LOCAL_KEY := 0x7726827caac94a7f9e1b160f7ea819f172f7b6f9d2a97f992c38edeab82d4110

# =========================================================
# Core Commands
# =========================================================

all: clean install build

clean:
	forge clean

install:
	forge install foundry-rs/forge-std@v1.8.2 --no-commit
	forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit
	forge install cyfrin/foundry-devops@0.2.2 --no-commit

update:
	forge update

build:
	forge build

test:
	forge test -vv

snapshot:
	forge snapshot

format:
	forge fmt

# =========================================================
# Local Blockchain (Anvil)
# =========================================================

anvil:
	anvil -m "test test test test test test test test test test test junk" \
	      --steps-tracing \
	      --block-time 1

# =========================================================
# Network Args (EVM)
# =========================================================

NETWORK_ARGS := --rpc-url $(ANVIL_RPC_URL) \
                --private-key $(ANVIL_PRIVATE_KEY) \
                --broadcast

ifeq ($(findstring sepolia,$(ARGS)),sepolia)
NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) \
                --private-key $(PRIVATE_KEY) \
                --broadcast \
                --verify \
                --etherscan-api-key $(ETHERSCAN_API_KEY) \
                -vvvv
endif

# =========================================================
# Robot NFT (Static On-Chain)
# =========================================================

deployRobot:
	forge script script/DeployRobotNft.s.sol:DeployRobotNft $(NETWORK_ARGS)

mintRobot:
	forge script script/Interactions.s.sol:MintRobotNft $(NETWORK_ARGS)

# =========================================================
# Mood NFT (Dynamic On-Chain)
# =========================================================

deployMood:
	forge script script/DeployMoodNft.s.sol:DeployMoodNft $(NETWORK_ARGS)

mintMood:
	forge script script/Interactions.s.sol:MintMoodNft $(NETWORK_ARGS)

flipMood:
	forge script script/Interactions.s.sol:FlipMoodNft $(NETWORK_ARGS)

# =========================================================
# zkSync (Optional / Advanced)
# =========================================================

zkbuild:
	foundryup-zksync
	forge build --zksync
	foundryup

zktest:
	foundryup-zksync
	forge test --zksync -vv
	foundryup

zkdeploy:
	foundryup-zksync
	forge create src/OurToken.sol:OurToken \
		--rpc-url $(ZKSYNC_LOCAL_RPC) \
		--private-key $(ZKSYNC_LOCAL_KEY) \
		--legacy \
		--zksync
	foundryup

# =========================================================
# Help
# =========================================================

help:
	@echo ""
	@echo "📦 Teri On-Chain NFT Project"
	@echo "Author: Maria Terese Ezeobi"
	@echo ""
	@echo "Local (Anvil):"
	@echo "  make anvil"
	@echo "  make deployRobot"
	@echo "  make mintRobot"
	@echo "  make deployMood"
	@echo "  make mintMood"
	@echo "  make flipMood"
	@echo ""
	@echo "zkSync (Advanced):"
	@echo "  make zkbuild"
	@echo "  make zktest"
	@echo "  make zkdeploy"
	@echo ""
