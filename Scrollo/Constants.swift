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
        static let BigText = Font.custom("Avenir", fixedSize: 30).weight(.semibold)
        static let MediumText = Font.custom("Avenir", fixedSize: 15).weight(.semibold)
        static let SmallText = Font.custom("Avenir", fixedSize: 10).weight(.semibold)
    }
    
    struct NPCsGenerator {
        static let Male_Names = ["Bob", "Bobius", "Bobin", "Boberius"]
        static let Female_Names = ["Bobina", "Boba", "Boberva", "Bobela"]
        static let Combat_Classes = ["Barbarian","Bard","Cleric","Fighter","Wizard"]
        static let Non_combat_Classes = ["Aristocrat","Artisan","Inkeeper","Scholar"]
        static let All_Classes = ["Random","Combat class"] + Combat_Classes + ["Non-combat class"] + Non_combat_Classes
        static let Classes_Stats_Prio = [[],[],[1,3,2,6,5,4],[6,2,5,4,3,1],[5,4,3,6,1,2],[1,2,3,6,4,5],[6,3,4,1,2,5],[],[6,4,5,2,3,1] ,[5,1,6,2,3,4],[3,4,2,6,5,1],[6,3,5,1,2,4]]
        static let Basic_Races = ["Human","Half Elf","Half Orc", "Dwarf"]
        static let Exotic_Races = ["Tabaxi","Aarakocra","Goliath"]
        static let All_Races = ["Random","Basic race"] + Basic_Races + ["Exotic race"] + Exotic_Races
        static let Base_AC = 10
        static let Maximum_HD = 30 // added +1 for random number picker
        static let Hit_Dices = [2, 4, 6, 8, 10, 12, 20, 100]
        static let Stats_Short = ["STR","DEX","CON","INT","WIS","CHA"]
        static let Skills = ["Acrobatics","Animal Handling","Arcana","Athletics","Deception","History","Insight","Intimidation", "Investigation","Medicine","Nature","Perception","Performance","Persuasion","Religion","Sleight of Hand","Stealth","Survival"]
        static let Skills_Tuples: [(String,Int)] = [("Acrobatics",1), ("Animal Handling",4), ("Arcana",3), ("Athletics",0), ("Deception",5), ("History",3), ("Insight",4), ("Intimidation",1), ("Investigation",3), ("Medicine",3), ("Nature",3), ("Perception",4), ("Performance",5), ("Persuasion",5), ("Religion",4), ("Sleight of Hand",1), ("Stealth",1), ("Survival",3)]
    }
    
    struct Spells {
        // indexes of available spells
        static let Bard_Spells = [3,7,9]
        static let Cleric_Spells = [4,12,14]
//        static let Druid_Spells = [2,4,5,7,9,14]
//        static let Sorcerer_Spells = [0,1,2,3,5,8,9,11,13]
        static let Wizard_Spells = [0,1,2,3,5,6,8,9,10,11,13]
        static let Wizard_Spells_Per_Level = [[3,2],
                                              [3,3],
                                              [3,4,2],
                                              [4,4,3],
                                              [4,4,3,2],
                                              [4,4,3,3],
                                              [4,4,3,3,1],
                                              [4,4,3,3,2],
                                              [4,4,3,3,3,1],
                                              [5,4,3,3,3,2],
                                              [5,4,3,3,3,2,1],
                                              [5,4,3,3,3,2,1],
                                              [5,4,3,3,3,2,1,1],
                                              [5,4,3,3,3,2,1,1],
                                              [5,4,3,3,3,2,1,1,1],
                                              [5,4,3,3,3,2,1,1,1],
                                              [5,4,3,3,3,2,1,1,1,1],
                                              [5,4,3,3,3,3,1,1,1,1],
                                              [5,4,3,3,3,3,2,1,1,1],
                                              [5,4,3,3,3,3,2,2,1,1]]
        // Maximum index of spell per level
        static let Max_idx_0 = 4
        static let Max_idx_1 = 9
        static let Max_idx_2 = 14
        static let Max_idx_3 = 19
        static let Max_idx_4 = 24
        static let Max_idx_5 = 29
        static let Max_idx_6 = 32
        static let Max_idx_7 = 35
        static let Max_idx_8 = 38
        static let Max_idx_9 = 41
        
        static let Magic_Schools = ["Abjuration","Conjuration","Divination","Enchantment","Evocation","Illusion","Necromancy","Transmutation"]
        
        // last spell index = 41
        // spells available per spell level
        static let All_spells_0 = [["index":0, "name":"Acid Splash", "school":Magic_Schools[1]],
                                   ["index":1, "name":"Chill Touch", "school":Magic_Schools[6]],
                                   ["index":2, "name":"Create Bonfire", "school":Magic_Schools[1]],
                                   ["index":3, "name":"Dancing Lights", "school":Magic_Schools[4]],
                                   ["index":4, "name":"Guidance", "school":Magic_Schools[2]]]
        static let All_spells_1 = [["index":5, "name":"Absorb Element", "school":Magic_Schools[0]],
                                   ["index":6, "name":"Alarm", "school":Magic_Schools[0]],
                                   ["index":7, "name":"Animal Friendship", "school":Magic_Schools[3]],
                                   ["index":8, "name":"Catapult", "school":Magic_Schools[7]],
                                   ["index":9, "name":"Charm Person", "school":Magic_Schools[3]]]
        static let All_spells_2 = [["index":10, "name":"Acid Arrow", "school":Magic_Schools[4]],
                                   ["index":11, "name":"Alter Self", "school":Magic_Schools[7]],
                                   ["index":12, "name":"Aid", "school":Magic_Schools[0]],
                                   ["index":13, "name":"Darkness", "school":Magic_Schools[4]],
                                   ["index":14, "name":"Guidance", "school":Magic_Schools[2]]]//
        static let All_spells_3 = [["index":15, "name":"Animate Dead", "school":Magic_Schools[6]],
                                   ["index":16, "name":"Bestow Curse", "school":Magic_Schools[6]],
                                   ["index":17, "name":"Blink", "school":Magic_Schools[7]],
                                   ["index":18, "name":"Catnap", "school":Magic_Schools[3]],
                                   ["index":19, "name":"Clairvoyance", "school":Magic_Schools[2]]]
        static let All_spells_4 = [["index":20, "name":"Arcane Eye", "school":Magic_Schools[2]],
                                   ["index":21, "name":"Banishment", "school":Magic_Schools[0]],
                                   ["index":22, "name":"Blight", "school":Magic_Schools[6]],
                                   ["index":23, "name":"Charm Monster", "school":Magic_Schools[3]],
                                   ["index":24, "name":"Fabricate", "school":Magic_Schools[7]]]
        static let All_spells_5 = [["index":25, "name":"Creation", "school":Magic_Schools[5]],
                                   ["index":26, "name":"Animate Objects", "school":Magic_Schools[7]],
                                   ["index":27, "name":"Arcane Hand", "school":Magic_Schools[4]],
                                   ["index":28, "name":"Cloudkill", "school":Magic_Schools[1]],
                                   ["index":29, "name":"Contact Other Plane", "school":Magic_Schools[2]]]
        static let All_spells_6 = [["index":30, "name":"Chain Lightning", "school":Magic_Schools[4]],
                                   ["index":31, "name":"Disintegrate", "school":Magic_Schools[7]],
                                   ["index":32, "name":"Flesh To Stone", "school":Magic_Schools[7]]]
        static let All_spells_7 = [["index":33, "name":"Crown of Stars", "school":Magic_Schools[4]],
                                   ["index":34, "name":"Finger of Death", "school":Magic_Schools[6]],
                                   ["index":35, "name":"Magnificent Mansion", "school":Magic_Schools[1]]]
        static let All_spells_8 = [["index":36, "name":"Control Weather", "school":Magic_Schools[7]],
                                   ["index":37, "name":"Clone", "school":Magic_Schools[6]],
                                   ["index":38, "name":"Maze", "school":Magic_Schools[4]]]
        static let All_spells_9 = [["index":39, "name":"Foresight", "school":Magic_Schools[2]],
                                   ["index":40, "name":"Astral Projection", "school":Magic_Schools[6]],
                                   ["index":41, "name":"Gate", "school":Magic_Schools[1]]]
        
        static let All_spells_by_level = [[All_spells_0], [All_spells_1], [All_spells_2], [All_spells_3], [All_spells_4], [All_spells_5], [All_spells_6], [All_spells_7], [All_spells_8], [All_spells_9]]
        static let All_spells = All_spells_0 + All_spells_1 + All_spells_2 + All_spells_3 + All_spells_4 + All_spells_5 + All_spells_6 + All_spells_7 + All_spells_8 + All_spells_9
    }
}
