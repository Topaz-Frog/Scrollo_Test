import SwiftUI

// Render png animation in blender with transparent background

struct RollDicesView: View {
    @EnvironmentObject var genManager: EventManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var generator: Generator
    @State private var showingAlert = false
    @State var isRolled: Bool = false
    @State var d: UInt32 = 20
    @State var value: Int = 0
    
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
                    genManager.removeFromAdded(generator: generator)
                } label: {
                    Image(systemName: "trash.circle")
                        .imageScale(.large)
                        .font(.system(size: 26, weight: .bold))
                        .padding(.trailing, 20)
                }
            }
            .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
            
            HStack(alignment: .top, spacing: 15) {
                
//                Color(red: 217/255, green: 125/255, blue: 84/255)
//                    .frame(width: 50)
//                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 20) {
                        
                        HStack(spacing: 20) {
                            Button { d=4 } label: { DiceButton(d:4) }
                            Button { d=6 } label: { DiceButton(d:6) }
                            Button { d=8 } label: { DiceButton(d:8) }
                        }
                        
                        HStack(spacing: 20) {
                            Button { d=10 } label: { DiceButton(d:10) }
                            Button { d=12 } label: { DiceButton(d:12) }
                            Button { d=20 } label: { DiceButton(d:20) }
                        }
                        
                        Spacer()
                        
                        if isRolled {
                            Text("\(value)")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 40))
                                .foregroundColor(.white)
                                .frame(alignment: .center)
                        }
                        
                        Spacer()
                        
                        Button {
                            roll()
                            isRolled = true
                            showingAlert = true
                        } label: {
                            Text("Roll the d\(d)")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 20))
                                .foregroundColor(.white)
                                .frame(alignment: .center)
                                .frame(width: 200, height: 60)
                                .background(Color.init(red: 110/255, green: 140/255, blue: 160/255))
                                .cornerRadius(20)
                                .contentShape(Rectangle())
                        }
//                        .alert("Rolling!", isPresented: $showingAlert) {
//                            Button("Nice!", role: .cancel) { }
//                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .background(Color.init(red: 51/255, green: 72/255, blue: 86/255))
            }
        }
        .background(Color.init(red: 217/255, green: 125/255, blue: 84/255))
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
    
    func roll() {
        value =  Int(arc4random_uniform(d) + 1)
    }
}

struct DiceButton: View {
    @State var d: UInt32
    
    var body: some View {
        Text("d\(d)")
            .fontWeight(.black)
            .font(Font.custom("Avenir", size: 20))
            .foregroundColor(Color.init(red: 51/255, green: 72/255, blue: 86/255))
            .frame(width: 80, height: 60)
            .background(Color.init(red: 110/255, green: 140/255, blue: 160/255))
            .cornerRadius(5)
            .contentShape(Rectangle())
    }
}

struct RollDicesView_Previews: PreviewProvider {
    static var previews: some View {
        RollDicesView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
    }
}
