import Foundation
import SwiftUI

struct Constants {
    
    struct Colors { // Powstawiać!
        static let OrangeBackground = Color.init(red: 217/255, green: 125/255, blue: 84/255)
        static let DarkBlueBackground = Color.init(red: 51/255, green: 72/255, blue: 86/255)
        static let LightBlueBackground = Color.init(red: 110/255, green: 140/255, blue: 160/255)
        
        static let DarkBlueText = Color.init(red: 50/255, green: 71/255, blue: 75/255)
    }
    
    struct Fonts { // Powstawiać wszędzie!
        static let DefaultText = Font.custom("Avenir", fixedSize: 20).weight(.black)
    }
    
    struct NPCsGenerator {
        static let Male_Names = ["Bob", "Bobius", "Bobin", "Boberius"]
        static let Female_Names = ["Bobina", "Boba", "Boberva", "Bobela"]
        static let Combat_Classes = ["Barbarian","Bard","Cleric","Druid","Fighter","Monk","Paladin","Ranger","Rogue","Sorcerer","Warlock","Wizard"]
        static let Non_combat_Classes = ["Aristocrat","Artisan","Inkeeper","Scholar"]
        static let Templates = ["Random","Combat class"] + Combat_Classes + ["Non-combat class"] + Non_combat_Classes
        static let Basic_Races = ["Human","Half Elf","Half Orc"]
        static let Exotic_Races = ["Tabaxi","Aarakocra","Goliath"]
        static let All_Races = ["Basic race"] + Basic_Races + ["Exotic race"] + Exotic_Races
        static let Base_AC = 10
        static let Maximum_HD = 31 // added +1 for random number picker
        static let Hit_Dices = [2, 4, 6, 8, 10, 12, 20, 100]
        static let Skills = ["Acrobatics","Animal Handling","Arcana","Athletics","Deception","History","Insight","Intimidation", "Investigation","Medicine","Nature","Perception","Performance","Persuasion","Religion","Sleight of Hand","Stealth","Survival"]
    }
    
    struct Spells {
        // indexes of available spells
        static let Wizard_Spells = [0]
        static let Cleric_Spells = [0]
        static let Sorcerer_Spells = [0]
        static let Bard_Spells = [0]
        static let Druid_Spells = [0]
        // Maximum index of spell per level
        static let Max_idx_1 = 1
        static let Max_idx_2 = 1
        static let Max_idx_3 = 1
        static let Max_idx_4 = 1
        static let Max_idx_5 = 1
        static let Max_idx_6 = 1
        static let Max_idx_7 = 1
        static let Max_idx_8 = 1
        static let Max_idx_9 = 1
        // spells available per spell level
        static let All_spells_1 = ["Fire Bolt"]
        static let All_spells_2 = ["Fire Bolt"]
        static let All_spells_3 = ["Fire Bolt"]
        static let All_spells_4 = ["Fire Bolt"]
        static let All_spells_5 = ["Fire Bolt"]
        static let All_spells_6 = ["Fire Bolt"]
        static let All_spells_7 = ["Fire Bolt"]
        static let All_spells_8 = ["Fire Bolt"]
        static let All_spells_9 = ["Fire Bolt"]
    }
}
