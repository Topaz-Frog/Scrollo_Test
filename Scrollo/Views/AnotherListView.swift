//
//  AnotherListView.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 23/01/2022.
//

import SwiftUI

struct AnotherListView: View {
    @EnvironmentObject var eventManager: EventManager
    @Environment(\.dismiss) private var dismiss
    
    @State var selected: String? = nil
    @State var index: Int? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(destination: SearchNpcView(generator: $eventManager.allGenerators[0]).environmentObject(eventManager), tag: "SearchNpc", selection: $selected) { EmptyView() }
            NavigationLink(destination: IdentifyScrollView(generator: $eventManager.allGenerators[3]).environmentObject(eventManager), tag: "IdentifyScroll", selection: $selected) { EmptyView() }
            NavigationLink(destination: RollDicesView(generator: $eventManager.allGenerators[5]).environmentObject(eventManager), tag: "RollDices", selection: $selected) { EmptyView() }
            NavigationLink(destination: FlipCoinView(generator: $eventManager.allGenerators[6]).environmentObject(eventManager), tag: "FlipCoin", selection: $selected) { EmptyView() }
            NavigationLink(destination: CallNumberView(generator: $eventManager.allGenerators[8]).environmentObject(eventManager), tag: "CallNumber", selection: $selected) { EmptyView() }
            List {
                ForEach(eventManager.generators.indices, id: \.self) { i in
                    if eventManager.generators[i].isImplemented {
                        Button {
                            index = i
                            selected = eventManager.generators[i].content
                        } label: {
                            GeneratorRow(generator: $eventManager.generators[i])
                        }
                    } else {
                        GeneratorRow(generator: $eventManager.generators[i])
                            .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                                Button {
                                    eventManager.removeFromAdded(generator: eventManager.generators[i])
                                } label: {
                                    Image(systemName: "trash.circle")
                                        .imageScale(.large)
                                        .font(.system(size: 26, weight: .bold))
                                }
                                .tint(.red)
                            })
                    }
                }
                .listRowBackground(Constants.Colors.DarkBlueBackground)
            }
            .listStyle(.plain)
            .navigationTitle("RandomStuff")
        }
        .background(Constants.Colors.OrangeBackground)
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
            .environmentObject(EventManager())
    }
}
