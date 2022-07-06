//
//  TalkNpcView.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 02/07/2022.
//

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
            
            HStack {
                Spacer()
                
                VStack {
                    Text("\(npc_idx)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).name)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).template)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).race)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).ac)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).hit_points)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).num_HD)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Text("\(eventManager.getNPC(id: npc_idx).hit_dice)")
                        .font(Constants.Fonts.DefaultText)
                    
                    Spacer()
                }
                .padding(.top,20)
                
                Spacer()
            }
            .background(Constants.Colors.DarkBlueBackground)
            .foregroundColor(Color.white)
//            Form {
//                HStack(alignment: .top, spacing: 15) {
//
//                    VStack(alignment: .leading, spacing: 20) {
//                        Menu {
//                            Picker(selection: $selected_template) {
//                                ForEach(0..<Constants.NPCsGenerator.All_Classes.count) {
//                                    Text(Constants.NPCsGenerator.All_Classes[$0])
//                                }
//                            } label: { }
//                        } label: {
//                            Text(Constants.NPCsGenerator.All_Classes[selected_template])
//                                .font(Constants.Fonts.DefaultText)
//                                .foregroundColor(Color.white)
//                        }
//
//
//                        Spacer()
//
//                        Section(header:Text("Race")) {
//                            Menu {
//                                Picker(selection: $selected_race) {
//                                    ForEach(0..<Constants.NPCsGenerator.All_Races.count) {
//                                        Text(Constants.NPCsGenerator.All_Races[$0])
//                                    }
//                                } label: { }
//                            } label: {
//                                Text(Constants.NPCsGenerator.All_Races[selected_race])
//                                    .font(Constants.Fonts.DefaultText)
//                                    .foregroundColor(Color.white)
//                            }
//                        }
//
//                        Spacer()
//
//                        Section(header:Text("Hit dice")) {
//
//                            HStack {
//                                Menu {
//                                    Picker(selection: $num_hd) {
//                                        ForEach(1...Constants.NPCsGenerator.Maximum_HD, id: \.self) { number in
//                                            Text("\(number)")
//                                        }
//                                    } label: { }
//                                } label: {
//                                    Text("\(num_hd)")
//                                        .font(Constants.Fonts.DefaultText)
//                                        .foregroundColor(Color.white)
//                                }
//
//                                Spacer()
//
//                                Menu {
//                                    Picker(selection: $selected_hd) {
//                                        ForEach(0..<Constants.NPCsGenerator.Hit_Dices.count) {
//                                            Text("d\(Constants.NPCsGenerator.Hit_Dices[$0])")
//                                        }
//                                    } label: { }
//                                } label: {
//                                    Text("d\(Constants.NPCsGenerator.Hit_Dices[selected_hd])")
//                                        .font(Constants.Fonts.DefaultText)
//                                        .foregroundColor(Color.white)
//                                }
//
//                                Spacer()
//                            }
//                        }
//
//                        Spacer()
//
//                        HStack {
//                            Spacer()
//
//                            Button() {
//
//                            } label: {
//                                Text("Find dat NPC!")
//                                    .font(Constants.Fonts.DefaultText)
//                                    .foregroundColor(Constants.Colors.DarkBlueText)
//                            }
//                        }
//                    }
//                    .padding(.top, 20)
//                }
//                .listRowBackground(Constants.Colors.LightBlueBackground)
//            }
//            .background(Constants.Colors.DarkBlueBackground)
//            .foregroundColor(Color.white)
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
}

struct TalkNpcView_Previews: PreviewProvider {
    static var previews: some View {
        TalkNpcView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)), npc_idx: 0)
    }
}
