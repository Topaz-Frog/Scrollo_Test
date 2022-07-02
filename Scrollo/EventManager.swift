import Foundation
// Zmienić żeby nie było nigdzie genManager
class EventManager: ObservableObject {
    @Published var createdNPCs = [
        NPC(id:"1", name:"Erwin", template:0, is_male:true, race: 1, ac:13, hit_points:0, hit_dice:0, num_HD:1, speed:30, stats:[20,12,20,8,8,8], skills:[0,3,7,10,12], spells:[Int]())
    ]
    
    @Published var allGenerators = [
        Generator(name: "TALK TO NPC", image: "id", description: "Generate random NPC", content: "SearchNpc", isImplemented: true),
        Generator(name: "TIME TO SHOP", image: "shop", description: "Create any shop you like", content: "Not yet available", isImplemented: false),
        Generator(name: "FIND A TAVERN", image: "tavern", description: "Find all the hidden plots, dishes and spices", content: "Not yet available", isImplemented: false),
        Generator(name: "IDENTIFY A SCROLL", image: "scroll", description: "Generate spellscroll or spellbook", content: "Not yet available", isImplemented: false),
        Generator(name: "GET YOUT LOOT", image: "coin", description: "Generate loot according to your encounter", content: "Not yet available", isImplemented: false),
        Generator(name: "ROLL DICES", image: "dice", description: "Roll dices", content: "RollDices", isImplemented: true),
        Generator(name: "FLIP A COIN", image: "coin", description: "As it says", content: "FlipCoin", isImplemented: true),
        Generator(name: "ENCOUNTER AN ENCOUNTER", image: "blades", description: "Generate enemies for your players", content: "Not yet available", isImplemented: false),
        Generator(name: "CALL A NUMBER", image: "shop", description: "Generate random number", content: "CallNumber", isImplemented: true),
        Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: false),
        Generator(name: "REVEAL A SCHEME", image: "latarnia", description: "Create organisation working behind the scenes", content: "Not yet available", isImplemented: false)
    ]
    
    @Published var generators = [
        Generator(name: "TALK TO NPC", image: "id", description: "Generate random NPC", content: "SearchNpc", isImplemented: true),
        Generator(name: "CALL A NUMBER", image: "shop", description: "Generate random number", content: "CallNumber", isImplemented: true),
        Generator(name: "ROLL DICES", image: "dice", description: "Roll dices", content: "RollDices", isImplemented: true),
        Generator(name: "FLIP A COIN", image: "coin", description: "As it says", content: "FlipCoin", isImplemented: true)
    ]
    
    func addNpcToList(npc: NPC) {
        if !createdNPCs.contains(where: { $0.id == npc.id}) {
            createdNPCs.append(npc)
        }
    }
    
    func getNPC(id: String) -> NPC {
        let tempNpc: NPC = createdNPCs.first(where: { $0.id == id})!
        
        return tempNpc
    }
    
    func addToList(generator: Generator) {
        if !allGenerators.contains(where: { $0.name == generator.name}) {
            allGenerators.append(generator)
        }
    }
    
    func removeFromList(generator: Generator) {
        allGenerators = allGenerators.filter { $0.name != generator.name}
    }
    
    func addToAdded(generator: Generator) {
        if !generators.contains(where: { $0.name == generator.name}) {
            generators.append(generator)
        }
    }
    
    func removeFromAdded(generator: Generator) {
        generators = generators.filter { $0.name != generator.name}
    }
    
    func isAdded(generator: Generator) -> Bool {
        return generators.contains(where: { $0.name == generator.name})
    }
    
    func getGenerator(cont: String) -> Generator {
        let tempGen: Generator = allGenerators.first(where: { $0.content == cont})!
        
        return tempGen
    }
}
