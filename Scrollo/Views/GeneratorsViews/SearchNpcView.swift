//
//  SearchNpcView.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 01/07/2022.
//

import SwiftUI

struct SearchNpcView: View {
    
    @EnvironmentObject var eventManager: EventManager
    @Environment(\.dismiss) private var dismiss
    @Binding var generator: Generator
    @State private var selected_view: String? = nil
    @State private var selected_id = 0
    @State private var selected_class = 0
    @State private var selected_race = 0
    @State private var selected_hd = 0
    @State private var num_hd = 1
    @State private var is_chaotic = false
    @State var idx: Int = 0
    
    var body: some View {
        NavigationLink(destination: TalkNpcView(generator: $eventManager.allGenerators[0], npc_idx: idx).environmentObject(eventManager), tag: "RandomNpc", selection: $selected_view) { EmptyView() }
        
        VStack(spacing: 0) {
            HStack {
                Text(generator.name)
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 30))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                Spacer()
                
                Button {
                    dismiss()
                    eventManager.removeFromList(generator: generator)
                } label: {
                    Image(systemName: "trash.circle")
                        .imageScale(.large)
                        .font(.system(size: 26, weight: .bold))
                }.padding(.trailing, 5)
            }
            .foregroundColor(Constants.Colors.DarkBlueText)
            
            Form {
                HStack(alignment: .top, spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Section(header: Text("Search by ID")) {
                            HStack {
                                Menu {
                                    Picker(selection: $selected_id) {
                                        if eventManager.getLastNpcIdx() > 0 {
                                            ForEach(0..<(eventManager.getLastNpcIdx() + 1)) {
                                                Text("\($0)")
                                            }
                                        } else {
                                            Text("0")
                                        }
                                    } label: { }
                                } label: {
                                    Text("\(selected_id)")
                                        .font(Constants.Fonts.DefaultText)
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    Text("\(Image(systemName: "chevron.right"))")
                                        .foregroundColor(.white)
                                }
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button() {
                                    idx = selected_id
                                    selected_view = "RandomNpc"
                                } label: {
                                    Text("Get dat NPC!")
                                        .font(Constants.Fonts.DefaultText)
                                        .foregroundColor(Constants.Colors.DarkBlueText)
                                }
                                .buttonStyle(GrowingButton(background_color: Constants.Colors.OrangeBackground))
                            }
                        }
                        
                        Line()
                            .stroke(Constants.Colors.DarkBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                            .frame(width: UIScreen.screenWidth * 0.85, height: 5)
                            .padding(.vertical, 5)
                        
                        Section(header:Text("Template")) {
                            Menu {
                                Picker(selection: $selected_class) {
                                    ForEach(0..<Constants.NPCsGenerator.All_Classes.count) {
                                        Text(Constants.NPCsGenerator.All_Classes[$0])
                                    }
                                } label: { }
                            } label: {
                                Text(Constants.NPCsGenerator.All_Classes[selected_class])
                                    .font(Constants.Fonts.DefaultText)
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                Text("\(Image(systemName: "chevron.right"))")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Line()
                            .stroke(Constants.Colors.DarkBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                            .frame(width: UIScreen.screenWidth * 0.85, height: 2)
                            .padding(.vertical, 5)
                        
                        Section(header:Text("Race")) {
                            Menu {
                                Picker(selection: $selected_race) {
                                    ForEach(0..<Constants.NPCsGenerator.All_Races.count) {
                                        Text(Constants.NPCsGenerator.All_Races[$0])
                                    }
                                } label: { }
                            } label: {
                                Text(Constants.NPCsGenerator.All_Races[selected_race])
                                    .font(Constants.Fonts.DefaultText)
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                Text("\(Image(systemName: "chevron.right"))")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Line()
                            .stroke(Constants.Colors.DarkBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                            .frame(width: UIScreen.screenWidth * 0.85, height: 2)
                            .padding(.vertical, 5)
                        
                        Section(header:Text("Hit dice")) {
                            
                            HStack {
                                Menu {
                                    Picker(selection: $num_hd) {
                                        ForEach(1...Constants.NPCsGenerator.Maximum_HD, id: \.self) { number in
                                            Text("\(number)")
                                        }
                                    } label: { }
                                } label: {
                                    Text("\(num_hd)")
                                        .font(Constants.Fonts.DefaultText)
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    Text("\(Image(systemName: "chevron.up.chevron.down"))")
                                        .foregroundColor(.white)
                                }
                                
                                Spacer(minLength: 30)
                                
                                Menu {
                                    Picker(selection: $selected_hd) {
                                        ForEach(0..<Constants.NPCsGenerator.Hit_Dices.count) {
                                            Text("d\(Constants.NPCsGenerator.Hit_Dices[$0])")
                                        }
                                    } label: { }
                                } label: {
                                    Text("d\(Constants.NPCsGenerator.Hit_Dices[selected_hd])")
                                        .font(Constants.Fonts.DefaultText)
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    Text("\(Image(systemName: "chevron.up.chevron.down"))")
                                        .foregroundColor(.white)
                                }
                                
                                Spacer(minLength: 60)
                            }
                        }
                        
                        Group {
                            Line()
                                .stroke(Constants.Colors.DarkBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                                .frame(width: UIScreen.screenWidth * 0.85, height: 2)
                                .padding(.vertical, 5)
                            
                            Toggle(isOn: $is_chaotic) {
                                Text("Chaotic stats?")
                                    .font(Constants.Fonts.DefaultText)
                                    .foregroundColor(Color.white)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: .orange))
                            
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                Button() {
                                    createNPC()
                                    selected_view = "RandomNpc"
                                } label: {
                                    Text("Find dat NPC!")
                                        .font(Constants.Fonts.DefaultText)
                                        .foregroundColor(Constants.Colors.DarkBlueText)
                                }
                                .buttonStyle(GrowingButton(background_color: Constants.Colors.OrangeBackground))
                            }
                        }
                    }
                    .padding(.top, 20)
                }
                .listRowBackground(Constants.Colors.LightBlueBackground)
//                .frame(minWidth: 0,
//                       maxWidth: .infinity,
//                       minHeight: 0,
//                       maxHeight: .infinity,
//                       alignment: .topLeading)
            }
            .background(Constants.Colors.DarkBlueBackground)
            .foregroundColor(Color.white)
        }
        .background(Constants.Colors.OrangeBackground)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    })  {
                        Text("\(Image(systemName: "chevron.left")) \(" Saved generators")")
                            .foregroundColor(.white)
                }
            }
        }
    }
    
    // move it to event manager
    public func createNPC() {
        let last_idx = eventManager.getLastNpcIdx()
        var name: String = ""
        var template: Int = selected_class
        let is_male: Bool = Bool.random()
        var race: Int = selected_race
        var ac: Int = 10
        var hit_points: Int = 0
        var speed: Int = 30
        var prof: Int = num_hd
        var stats: [Int] = [Int]()
        var skills: [Int] = [Int]()
        var spells: [Int] = [Int]()
        
        // Temp lists from Constants
        let all_classes = Constants.NPCsGenerator.All_Classes
        let com_classes = Constants.NPCsGenerator.Combat_Classes
        let ncom_classes = Constants.NPCsGenerator.Non_combat_Classes
        
        let all_races = Constants.NPCsGenerator.All_Races
        let basic_races = Constants.NPCsGenerator.Basic_Races
        let exotic_races = Constants.NPCsGenerator.Exotic_Races
        
        print(last_idx)
        print(all_classes[template])
        print(all_races[race])
        
        // Create Index
        if last_idx != -1 { idx = last_idx + 1 }
        else { idx = 0 }
        
        print(idx)
        
        // Add sex
        if is_male { name = Constants.NPCsGenerator.Male_Names.randomElement()! }
        else { name = Constants.NPCsGenerator.Female_Names.randomElement()! }
        
        print(is_male)
        print(name)
        
        // Assign class
        if com_classes.contains(all_classes[selected_class]) || ncom_classes.contains(all_classes[selected_class]) {
            template = selected_class
        } else if all_classes[selected_class] == "Combat class" {
            let rng_class = com_classes.randomElement()
            template = all_classes.firstIndex(where: {$0 == rng_class})!
        } else if all_classes[selected_class] == "Non-combat class" {
            let rng_class = ncom_classes.randomElement()
            template = all_classes.firstIndex(where: {$0 == rng_class})!
        } else {
            while all_classes[template] == "Random" || all_classes[template] == "Combat class" || all_classes[template] == "Non-combat class" {
                template = Int.random(in: 0..<all_classes.count)
            }
        }
        
        print(all_classes[template])
        
        // Assign race
        if basic_races.contains(all_races[selected_race]) || exotic_races.contains(all_races[selected_race]) {
            race = selected_race
        } else if all_races[selected_race] == "Basic race" {
            let rng_race = basic_races.randomElement()
            race = all_races.firstIndex(where: {$0 == rng_race})!
        } else if all_races[selected_race] == "Exotic race" {
            let rng_race = exotic_races.randomElement()
            race = all_races.firstIndex(where: {$0 == rng_race})!
        } else {
            while all_races[race] == "Random" || all_races[race] == "Basic race" || all_races[race] == "Exotic race" {
                race = Int.random(in: 0..<all_races.count)
            }
        }
        
        print(all_races[race])
        
        // Assign stats
        var temp_stats = [Int]()
        for _ in 0 ..< 6 {
            let dice1 = Int.random(in: 1...6)
            let dice2 = Int.random(in: 1...6)
            let dice3 = Int.random(in: 1...6)
            let dice4 = Int.random(in: 1...6)
            var temp_list = [dice1,dice2,dice3,dice4]
            temp_list.sort {
                $0 > $1
            }
            temp_list.removeLast()
            
            temp_stats.append(temp_list.reduce(0, +))
        }
        temp_stats.sort {
            $0 > $1
        }
        
        for i in Constants.NPCsGenerator.Classes_Stats_Prio[template] {
            stats.append(temp_stats[i-1])
        }
        
        print(stats)
        
        // Prepare modifiers
        var modifiers = [Int]()
        for stat in stats {
            var temp_mod = Double(stat - 10)/2.0
            temp_mod.round(.down)
            modifiers.append(Int(temp_mod))
        }
        
        print(modifiers)
        
        // Assign armor class
        ac = 10 + modifiers[1]
        
        // Assign proficiency
        if num_hd < 1 {
            num_hd = 1
            prof = 1
        } else if num_hd < 5 {
            prof = 2
        } else if num_hd < 9 {
            prof = 3
        } else if num_hd < 13 {
            prof = 4
        } else if num_hd < 17 {
            prof = 5
        } else if num_hd < 21 {
            prof = 6
        } else if num_hd < 25 {
            prof = 7
        } else if num_hd < 29 {
            prof = 8
        } else {
            prof = 9
        }
        
        print(num_hd)
        print(prof)
        
        // Get HP
        for _ in 0 ..< num_hd {
            hit_points += Int.random(in: 1...Constants.NPCsGenerator.Hit_Dices[selected_hd]) + modifiers[2]
        }
        
        print(hit_points)
        
        if hit_points < 1 {
            hit_points = 1
        }
        
        print(hit_points)
        
        
        // run fast... or slow
        if all_races[race] == "Tabaxi" {
            speed = 40
        } else if all_races[race] == "Dwarf" {
            speed = 20
        }
        
        // Get skilled
        let skills_idxs = 0..<Constants.NPCsGenerator.Skills.count
        let shuffled_idxs = skills_idxs.shuffled()
        for i in 0 ..< prof {
            skills.append(shuffled_idxs[i])
        }
        
        print(prof)
        
        // Time for magic
        if all_classes[template] == "Wizard" {
            var level = num_hd
            if level > 20 {
                level = 20
            }
            
            let max_spell_lvl = Constants.Spells.Wizard_Spells_Per_Level[level - 1].count
            print(max_spell_lvl)
            
            for spell_lvl in 0..<max_spell_lvl {
                var shuffled_spells = Constants.Spells.All_spells_by_level[spell_lvl][0].shuffled()
                var picked_spells = [Int]()
                print(Constants.Spells.Wizard_Spells_Per_Level[level - 1][spell_lvl])
                while picked_spells.count < Constants.Spells.Wizard_Spells_Per_Level[level - 1][spell_lvl] || shuffled_spells.count == 0 {
                    if Constants.Spells.Wizard_Spells.contains((shuffled_spells[0]["index"] as! Int)) {
                        picked_spells.append(shuffled_spells[0]["index"] as! Int)
                    }
                    shuffled_spells.removeFirst()
                }
                spells.append(contentsOf: picked_spells)
            }

            spells.sort() // Should sort by index, dont know yet how to do that
        }
        
        for spell in spells {
            print(Constants.Spells.All_spells[spell])
        }
        
        eventManager.addNpcToList(npc: NPC(id: idx, name: name, template: template, is_male: is_male, race: race, ac: ac, hit_points: hit_points, hit_dice: selected_hd, num_HD: num_hd, speed: speed, proficiency: prof, stats: stats, modifiers: modifiers, skills: skills, spells: spells))
    }
}

struct SearchNpcView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNpcView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
            .environmentObject(EventManager())
    }
}
