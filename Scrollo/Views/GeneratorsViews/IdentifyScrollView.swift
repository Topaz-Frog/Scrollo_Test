//
//  IdentifyScrollView.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 11/07/2022.
//

import SwiftUI

struct IdentifyScrollView: View {
    @EnvironmentObject var eventManager: EventManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var generator: Generator
    @State var spells = Constants.Spells.All_spells_better
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(generator.name)
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 30))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                Spacer()
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    eventManager.removeFromList(generator: generator)
                } label: {
                    Image(systemName: "trash.circle")
                        .imageScale(.large)
                        .font(.system(size: 26, weight: .bold))
                }
            }
            .foregroundColor(Constants.Colors.DarkBlueText)
            
            
            List {
                ForEach($spells) { $spell in
                    HStack(alignment: .center, spacing: 10)
                    {
                        //MARK: Image
                        Image("scroll")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(10)
                        
                        // MARK: Name and desc
                        VStack(alignment: .leading, spacing: 5)
                        {
                            Text("\(spell.name)")
                                .font(Constants.Fonts.DefaultText)
                                .frame(width: 200, alignment: .topLeading)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Level: \(spell.level == 0 ? "Cantrip" : String(spell.level))")
                                        .font(Font.custom("Avenir", size: 12))
                                    
                                    Text(spell.school.rawValue)
                                        .font(Font.custom("Avenir", size: 12))
                                }
                                
                                Spacer()
                                
                                Text("Components:\n\(spell.verbal ? "V  " : "")\(spell.somatic ? "S  " : "")\(spell.material ? "M" : "")")
                                    .font(Font.custom("Avenir", size: 12))
                            }
                        }
                        .padding(.vertical)
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .background(Constants.Colors.LightBlueBackground)
                    .frame(minWidth: 0, minHeight: 0)
                    .cornerRadius(16)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                }
                .listRowBackground(Constants.Colors.DarkBlueBackground)
            }
            .listStyle(.plain)
        }
        .background(Constants.Colors.OrangeBackground)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })  {
                        Text("\(Image(systemName: "chevron.left")) \(" Saved generators")")
                            .foregroundColor(.white)
                }
            }
        }
    }
    
    func getSpellcastingLevel(i:Int) -> Int {
        let index = i
        switch index {
        case 0...Constants.Spells.Max_idx_0:
            return 0
        case (Constants.Spells.Max_idx_0 + 1)...Constants.Spells.Max_idx_1:
            return 1
        case (Constants.Spells.Max_idx_1 + 1)...Constants.Spells.Max_idx_2:
            return 2
        case (Constants.Spells.Max_idx_2 + 1)...Constants.Spells.Max_idx_3:
            return 3
        case (Constants.Spells.Max_idx_3 + 1)...Constants.Spells.Max_idx_4:
            return 4
        case (Constants.Spells.Max_idx_4 + 1)...Constants.Spells.Max_idx_5:
            return 5
        case (Constants.Spells.Max_idx_5 + 1)...Constants.Spells.Max_idx_6:
            return 6
        case (Constants.Spells.Max_idx_6 + 1)...Constants.Spells.Max_idx_7:
            return 7
        case (Constants.Spells.Max_idx_7 + 1)...Constants.Spells.Max_idx_8:
            return 8
        case (Constants.Spells.Max_idx_8 + 1)...Constants.Spells.Max_idx_9:
            return 9
        default:
            return 0
        }
    }
}

struct IdentifyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        IdentifyScrollView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
            .environmentObject(EventManager())
    }
}
