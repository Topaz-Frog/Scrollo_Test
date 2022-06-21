import Foundation

class GeneratorsManager: ObservableObject {
    @Published var allGenerators = [
        Generator(name: "TALK TO NPC", image: "id", description: "Generate random NPC", content: "Not yet available", isImplemented: false),
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
        Generator(name: "FIND A TAVERN", image: "tavern", description: "Find all the hidden plots, dishes and spices", content: "Not yet available", isImplemented: false),
        Generator(name: "GET YOUT LOOT", image: "coin", description: "Generate loot according to your encounter", content: "Not yet available", isImplemented: false),
        Generator(name: "ROLL DICES", image: "dice", description: "Roll dices", content: "RollDices", isImplemented: true),
        Generator(name: "FLIP A COIN", image: "coin", description: "As it says", content: "FlipCoin", isImplemented: true),
        Generator(name: "ENCOUNTER AN ENCOUNTER", image: "blades", description: "Generate enemies for your players", content: "Not yet available", isImplemented: false),
        Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: false)
    ]
    
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
