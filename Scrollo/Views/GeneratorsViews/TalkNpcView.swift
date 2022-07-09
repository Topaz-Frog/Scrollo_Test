import SwiftUI

struct TalkNpcView: View {
    
    @EnvironmentObject var eventManager: EventManager
    @Environment(\.dismiss) private var dismiss
    @Binding var generator: Generator
    @State var npc_idx: Int
    @State private var selected_template = 0
    @State private var selected_race = 0
    @State private var selected_hd = 0
    @State private var num_hd = 1
    
    let words = ["This", "is", "an", "example"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(generator.name)
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 30))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                Spacer()
            }
            .foregroundColor(Constants.Colors.DarkBlueText)
            
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        Text("\(eventManager.getNPC(id: npc_idx).name)")
                            .font(Constants.Fonts.BigText)
                        
                        Text(" : ")
                            .font(Constants.Fonts.BigText)
                        
                        Text("\(Constants.NPCsGenerator.All_Classes[eventManager.getNPC(id: npc_idx).template])")
                            .font(Constants.Fonts.BigText)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        if eventManager.getNPC(id: npc_idx).is_male {
                            Text("Male ")
                                .font(Constants.Fonts.SmallText)
                                .foregroundColor(.gray)
                        } else {
                            Text("Female ")
                                .font(Constants.Fonts.SmallText)
                                .foregroundColor(.gray)
                        }
                        
                        Text("\(Constants.NPCsGenerator.All_Races[eventManager.getNPC(id: npc_idx).race])")
                            .font(Constants.Fonts.SmallText)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("ID:\(npc_idx)")
                            .font(Constants.Fonts.SmallText)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    
                    Line()
                        .stroke(Constants.Colors.LightBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        .frame(width: UIScreen.screenWidth, height: 10)
                    
                    Group {
                        Text("**Armor Class**: \(eventManager.getNPC(id: npc_idx).ac)")
                            .font(Constants.Fonts.MediumText)
                        
                        Text("**Hit Points**: \(eventManager.getNPC(id: npc_idx).hit_points) (\(eventManager.getNPC(id: npc_idx).num_HD)d\(Constants.NPCsGenerator.Hit_Dices[eventManager.getNPC(id: npc_idx).hit_dice]) \(eventManager.getNPC(id: npc_idx).modifiers[2] < 0 ? " " : " + ") \(eventManager.getNPC(id: npc_idx).num_HD * eventManager.getNPC(id: npc_idx).modifiers[2]))")
                            .font(Constants.Fonts.MediumText)
                        
                        Text("**Speed**: \(eventManager.getNPC(id: npc_idx).speed)ft. (\(eventManager.getNPC(id: npc_idx).speed * 3 / 10) m / \(eventManager.getNPC(id: npc_idx).speed / 5) sqr)")
                            .font(Constants.Fonts.MediumText)
                        
                        Text("**Proficiency**: +\(eventManager.getNPC(id: npc_idx).proficiency)")
                            .font(Constants.Fonts.MediumText)
                        
                    }
                    .padding(.horizontal, 20)
                    
                    Line()
                        .stroke(Constants.Colors.LightBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        .frame(width: UIScreen.screenWidth, height: 10)
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("STR")
                            .fontWeight(.black)
                            .font(Constants.Fonts.MediumText)
                        
                        Text("\(eventManager.getNPC(id: npc_idx).stats[0]) (\(eventManager.getNPC(id: npc_idx).modifiers[0] < 0 ? String(eventManager.getNPC(id: npc_idx).modifiers[0]) : "+" + String(eventManager.getNPC(id: npc_idx).modifiers[0])))")
                            .font(Constants.Fonts.MediumText)
                    }
                    
                    VStack(alignment: .center) {
                        Text("DEX")
                            .fontWeight(.black)
                            .font(Constants.Fonts.MediumText)
                        
                        Text("\(eventManager.getNPC(id: npc_idx).stats[1]) (\(eventManager.getNPC(id: npc_idx).modifiers[1] < 0 ? String(eventManager.getNPC(id: npc_idx).modifiers[1]) : "+" + String(eventManager.getNPC(id: npc_idx).modifiers[1])))")
                            .font(Constants.Fonts.MediumText)
                    }
                    
                    VStack(alignment: .center) {
                        Text("CON")
                            .fontWeight(.black)
                            .font(Constants.Fonts.MediumText)
                        
                        Text("\(eventManager.getNPC(id: npc_idx).stats[2]) (\(eventManager.getNPC(id: npc_idx).modifiers[2] < 0 ? String(eventManager.getNPC(id: npc_idx).modifiers[2]) : "+" + String(eventManager.getNPC(id: npc_idx).modifiers[2])))")
                            .font(Constants.Fonts.MediumText)
                    }
                    
                    VStack(alignment: .center) {
                        Text("INT")
                            .fontWeight(.black)
                            .font(Constants.Fonts.MediumText)
                        
                        Text("\(eventManager.getNPC(id: npc_idx).stats[3]) (\(eventManager.getNPC(id: npc_idx).modifiers[3] < 0 ? String(eventManager.getNPC(id: npc_idx).modifiers[3]) : "+" + String(eventManager.getNPC(id: npc_idx).modifiers[3])))")
                            .font(Constants.Fonts.MediumText)
                    }
                    
                    VStack(alignment: .center) {
                        Text("WIS")
                            .fontWeight(.black)
                            .font(Constants.Fonts.MediumText)
                        
                        Text("\(eventManager.getNPC(id: npc_idx).stats[4]) (\(eventManager.getNPC(id: npc_idx).modifiers[4] < 0 ? String(eventManager.getNPC(id: npc_idx).modifiers[4]) : "+" + String(eventManager.getNPC(id: npc_idx).modifiers[4])))")
                            .font(Constants.Fonts.MediumText)
                    }
                    
                    VStack(alignment: .center) {
                        Text("CHA")
                            .fontWeight(.black)
                            .font(Constants.Fonts.MediumText)
                        
                        Text("\(eventManager.getNPC(id: npc_idx).stats[5]) (\(eventManager.getNPC(id: npc_idx).modifiers[5] < 0 ? String(eventManager.getNPC(id: npc_idx).modifiers[5]) : "+" + String(eventManager.getNPC(id: npc_idx).modifiers[5])))")
                            .font(Constants.Fonts.MediumText)
                    }
                }
                .padding(.horizontal, 20)
                .frame(width: UIScreen.screenWidth,alignment: .center)
                
                Group {
                    getSkills().reduce(Text("\nSkills: ").font(Constants.Fonts.MediumText).fontWeight(.black), { $0 + Text($1).font(Constants.Fonts.MediumText) + Text("  ").font(Constants.Fonts.MediumText)} )
                }
                .padding(.horizontal, 20)
                
                Line()
                    .stroke(Constants.Colors.LightBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .frame(width: UIScreen.screenWidth, height: 10)
                
                Text("Actions")
                    .fontWeight(.semibold)
                    .font(Constants.Fonts.DefaultText)
                    .padding(.horizontal, 20)
                
                if eventManager.getNPC(id: npc_idx).spells.count > 0 {
                    Line()
                        .stroke(Constants.Colors.LightBlueBackground, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        .frame(width: UIScreen.screenWidth, height: 10)
                    
                    Text("Spells")
                        .fontWeight(.semibold)
                        .font(Constants.Fonts.DefaultText)
                        .padding(.horizontal, 20)
                    
                    Text("**Spellcasting.** The \(eventManager.getNPC(id: npc_idx).template) has \(eventManager.getNPC(id: npc_idx).num_HD) level(s). Its spellcasting ability")
                        .font(Constants.Fonts.MediumText)
                        .padding(.horizontal, 20)
                    
                    ForEach(0..<Constants.Spells.Wizard_Spells_Per_Level[getSpellcasting()].count, id: \.self) {
                        getSpells(level: $0).reduce(Text("\($0 == 0 ? "Cantrips (at will): ": String($0) + ". level (\(Constants.Spells.Wizard_Spells_Per_Level[eventManager.getNPC(id: npc_idx).num_HD][$0]) slots): ")").font(Constants.Fonts.MediumText).fontWeight(.black), { $0 + Text($1).font(Constants.Fonts.MediumText) + Text(", ").font(Constants.Fonts.MediumText)} )
                        .padding(.horizontal, 20)
                    }
                }
                
                Spacer()
            }
            .padding(.top,20)
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
                            .foregroundColor(Constants.Colors.DarkBlueText)
                }
            }
        }
    }
    
    private func getProf() -> Int {
        return eventManager.getNPC(id: npc_idx).proficiency
    }
    
    private func getSkills() -> [String] {
        var skills_strings = [String]()
        for skill in eventManager.getNPC(id: npc_idx).skills {
            let prof_mod = eventManager.getNPC(id: npc_idx).modifiers[Constants.NPCsGenerator.Skills_Tuples[skill].1] + eventManager.getNPC(id: npc_idx).proficiency
            if prof_mod < 0 {
                skills_strings.append((Constants.NPCsGenerator.Skills_Tuples[skill].0 + " " + String(prof_mod)))
            } else {
                skills_strings.append((Constants.NPCsGenerator.Skills_Tuples[skill].0 + " +" + String(prof_mod)))
            }
        }
        return skills_strings
    }
    
    private func getSpells(level:Int) -> [String] {
        var spells_strings = [String]()
        var spells_indexes = [Int]()
        for spell in Constants.Spells.All_spells_by_level[level][0] {
            spells_indexes.append(spell["index"] as! Int)
        }
        for spell in eventManager.getNPC(id: npc_idx).spells {
            if spells_indexes.contains(Constants.Spells.All_spells[spell]["index"] as! Int) {
                spells_strings.append(Constants.Spells.All_spells[spell]["name"] as! String)
            }
        }
        return spells_strings
    }
    
    private func getSpellcasting() -> Int {
        return eventManager.getNPC(id: npc_idx).num_HD > 20 ? 20 : eventManager.getNPC(id: npc_idx).num_HD
    }
}

struct TalkNpcView_Previews: PreviewProvider {
    static var previews: some View {
        TalkNpcView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)), npc_idx: 0)
            .environmentObject(EventManager())
    }
}
