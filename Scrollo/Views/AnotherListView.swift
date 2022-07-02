//
//  AnotherListView.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 23/01/2022.
//

import SwiftUI

struct AnotherListView: View {
    @EnvironmentObject var genManager: EventManager
    @Environment(\.dismiss) private var dismiss
    
    @State var selected: String? = nil
    @State var index: Int? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(destination: SearchNpcView(generator: $genManager.allGenerators[0]).environmentObject(genManager), tag: "SearchNpc", selection: $selected) { EmptyView() }
            NavigationLink(destination: RollDicesView(generator: $genManager.allGenerators[5]).environmentObject(genManager), tag: "RollDices", selection: $selected) { EmptyView() }
            NavigationLink(destination: FlipCoinView(generator: $genManager.allGenerators[6]).environmentObject(genManager), tag: "FlipCoin", selection: $selected) { EmptyView() }
            NavigationLink(destination: CallNumberView(generator: $genManager.allGenerators[8]).environmentObject(genManager), tag: "CallNumber", selection: $selected) { EmptyView() }
            List {
                ForEach(genManager.generators.indices, id: \.self) { i in
                    if genManager.generators[i].isImplemented {
                        Button {
                            index = i
                            selected = genManager.generators[i].content
                        } label: {
                            GeneratorRow(generator: $genManager.generators[i])
                        }
                    } else {
                        GeneratorRow(generator: $genManager.generators[i])
                            .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                                Button {
                                    genManager.removeFromAdded(generator: genManager.generators[i])
                                } label: {
                                    Image(systemName: "trash.circle")
                                        .imageScale(.large)
                                        .font(.system(size: 26, weight: .bold))
                                }
                                .tint(.red)
                            })
                    }
                }
                .listRowBackground(Color.init(red: 51/255, green: 72/255, blue: 86/255))
            }
            .listStyle(.plain)
            .navigationTitle("RandomStuff")
        }
        .background(Color.init(red: 217/255, green: 125/255, blue: 84/255))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    })  {
                        Text("\(Image(systemName: "chevron.left")) \(" Home")")
                            .foregroundColor(.white)
                }
            }
        }
    }
}

struct AnotherListView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherListView()
    }
}
