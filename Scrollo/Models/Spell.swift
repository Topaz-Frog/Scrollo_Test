//
//  Spell.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 11/07/2022.
//

import Foundation

enum MagicSchoolType : String {
  case Abjuration, Conjuration, Divination, Enchantment, Evocation, Illusion, Necromancy, Transmutation
  
//  var description : String {
//    switch self {
//    // Use Internationalization, as appropriate.
//    case .Abjuration: return "Abjuration"
//    case .Conjuration: return "Conjuration"
//    case .Divination: return "Divination"
//    case .Enchantment: return "Enchantment"
//    case .Evocation: return "Evocation"
//    case .Illusion: return "Illusion"
//    case .Necromancy: return "Necromancy"
//    case .Transmutation: return "Transmutation"
//    }
//  }
}

struct Spell: Identifiable {
    let id = UUID()
    var level: Int
    var name: String
    var school: MagicSchoolType
    var description: String
    var verbal: Bool = false
    var somatic: Bool = false
    var material: Bool = false
    
    init(level:Int, name: String, school: MagicSchoolType, description: String, verbal: Bool, somatic: Bool, material: Bool) {
        self.level = level
        self.name = name
        self.school = school
        self.description = description
        self.verbal = verbal
        self.somatic = somatic
        self.material = material
    }
    
    init() {
        self.init(level: 0, name: "", school: MagicSchoolType.Abjuration, description: "", verbal: false, somatic: false, material: false)
    }
}
