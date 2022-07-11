//
//  SpellRow.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 11/07/2022.
//

import SwiftUI

struct SpellRow: View {
    @Binding var spell: Spell
    @State var spells = Constants.Spells.All_spells_better
    
    var body: some View {
        
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
                    .foregroundColor(.white)
                    .frame(width: 200, alignment: .topLeading)
                
                Text("Spellcasting level: \(spell.level)\nSchool: \(String(reflecting: spell.school))")
                    .font(Font.custom("Avenir", size: 12))
                    .foregroundColor(.white)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .background(Constants.Colors.LightBlueBackground)
        .frame(minWidth: 0, minHeight: 0)
        .cornerRadius(16)
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

struct SpellRow_Previews: PreviewProvider {
    static var previews: some View {
        SpellRow(spell: .constant(Constants.Spells.All_spells_better[0]))
            .environmentObject(EventManager())
    }
}
