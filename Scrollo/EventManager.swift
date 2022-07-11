import Foundation
import SwiftUI
import LocalAuthentication

// Zmienić żeby nie było nigdzie genManager
class EventManager: ObservableObject {
    @Published var isValidated = false
    @Published var isAuthorized = false
    
    @Published var createdNPCs = [
        NPC(id:0, name:"Erwin", template:0, is_male:true, race: 1, ac:13, hit_points:0, hit_dice:0, num_HD:1, speed:30, proficiency: 1, stats:[20,12,20,8,8,8], modifiers:[5,1,5,-1,-1,-1], skills:[0,3,7,10,12], spells:[Int]())
    ]
    
    @Published var allGenerators = [
        Generator(name: "TALK TO NPC", image: "id", description: "Generate random NPC", content: "SearchNpc", isImplemented: true),
        Generator(name: "TIME TO SHOP", image: "shop", description: "Create any shop you like", content: "Not yet available", isImplemented: false),
        Generator(name: "FIND A TAVERN", image: "tavern", description: "Find all the hidden plots, dishes and spices", content: "Not yet available", isImplemented: false),
        Generator(name: "IDENTIFY A SCROLL", image: "scroll", description: "Generate spellscroll or spellbook", content: "Not yet available", isImplemented: true),
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
        Generator(name: "FLIP A COIN", image: "coin", description: "As it says", content: "FlipCoin", isImplemented: true),
        Generator(name: "IDENTIFY A SCROLL", image: "scroll", description: "Generate spellscroll or spellbook", content: "IdentifyScroll", isImplemented: true)
    ]
    
    enum BiometricType {
        case none
        case touch
        case face
    }
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        case deniedAccess
        case noFingerprintEnrolled
        case noFaceIdEnrolled
        case biometricError
        case credentialsNotSaved
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Either your email or password are incorrect. Please try again.", comment: "")
            case .deniedAccess:
                return NSLocalizedString("You have denied access for Face ID authentication. Please go to the settings app and change it in the Scrollo application.", comment: "")
            case .noFingerprintEnrolled:
                return NSLocalizedString("You have not registered any fingerprints yet.", comment: "")
            case .noFaceIdEnrolled:
                return NSLocalizedString("You have not registered any Face ID yet.", comment: "")
            case .biometricError:
                return NSLocalizedString("Your Faace ID was not recognized.", comment: "")
            case .credentialsNotSaved:
                return NSLocalizedString("Your credentials have not been saved. Do you want to save them after the next successful login?", comment: "")
            }
        }
    }
    
    func biometricType() -> BiometricType {
            let authContext = LAContext()
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch authContext.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touch
            case .faceID:
                return .face
            @unknown default:
                return .none
            }
        }
        
    func requestBiometricUnlock(completion: @escaping (Result<Credentials, AuthenticationError>) -> Void) {
//        let credentials:Credentials? = Credentials(email: "anything", password: "password")
//        let credentials:Credentials? = nil
        let credentials = KeychainStorage.getCredentials()
        guard let credentials = credentials else {
            completion(.failure(.credentialsNotSaved))
            return
        }
        let context = LAContext()
        var error: NSError?
        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if let error = error {
            switch error.code {
            case -6:
                completion(.failure(.deniedAccess))
            case -7:
                if context.biometryType == .faceID {
                    completion(.failure(.noFaceIdEnrolled))
                } else {
                    completion(.failure(.noFingerprintEnrolled))
                }
            default:
                completion(.failure(.biometricError))
            }
            return
        }
        if canEvaluate {
            if context.biometryType != .none {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Need to access credentials.") { success, error in
                    DispatchQueue.main.async {
                        if error != nil {
                            completion(.failure(.biometricError))
                        } else {
                            completion(.success(credentials))
                        }
                    }
                }
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
    
    func addNpcToList(npc: NPC) {
        if !createdNPCs.contains(where: { $0.id == npc.id}) {
            createdNPCs.append(npc)
        }
    }
    
    func getNPC(id: Int) -> NPC {
        let tempNpc: NPC = createdNPCs.first(where: { $0.id == id})!
        
        return tempNpc
    }
    
    func getLastNpcIdx() -> Int {
        if let lastNpc: NPC = createdNPCs.last {
            return lastNpc.id
        }
        
        return -1
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
