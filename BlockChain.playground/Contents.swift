import UIKit

// Create block class
class Block {
    var hash = String()
    var data = String()
    var prevHash = String()
    var index = Int()
    
    func createHash() -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

// Create a blockchain class
class BlockChain {
    var chain = [Block]()
    
    func createGenesisBlock(data: String) {
        let gBlock = Block()
        gBlock.data = data
        gBlock.hash = gBlock.createHash()
        gBlock.prevHash = "nil genesisBlock"
        gBlock.index = 0
        chain.append(gBlock)
    }
    
    func addBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.createHash()
        newBlock.data = data
        newBlock.prevHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
    
}

// Crate chain
let rojCoin = BlockChain()
rojCoin.createGenesisBlock(data: "From: A To: B Amount: 100")
rojCoin.addBlock(data: "From: B To: C Amount: 80")
rojCoin.addBlock(data: "From: C To: D Amount: 60")
rojCoin.addBlock(data: "From: C To: D Amount: 40")

rojCoin.chain[2].data

// tamper with chain data
rojCoin.chain[2].hash = "Hack by xxx"


// Print Chain data

for i in 1...rojCoin.chain.count - 1 {
    print("\nBlock: \(rojCoin.chain[i].index)\n Hash: \(rojCoin.chain[i].hash)\n Pre: \(rojCoin.chain[i].prevHash)\n Data: \(rojCoin.chain[i].data)\n")
}

// check validity of chain

var isChainValid = true

for i in 1...rojCoin.chain.count - 1 {
    if rojCoin.chain[i].prevHash != rojCoin.chain[i - 1].hash {
        isChainValid = false
    }
}

print("Chain is valide: \(isChainValid)")

