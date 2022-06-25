import SwiftUI

struct FlipCoinView: View {
    @EnvironmentObject var genManager: GeneratorsManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var generator: Generator
    @State private var showingAlert = false
    @State var isFlipping: Bool = false
    @State var isHeads: Bool = false
    @State var degreesToFlip: Int = 0
    
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
                        
                        Spacer()
                        
                        Coin(isFlipping: $isFlipping, isHeads: $isHeads)
                            .rotation3DEffect(Angle(degrees: Double(degreesToFlip)), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                        
                        Spacer()
                        
                        if (isHeads) {
                            Text("It's heads!")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 20))
                                .foregroundColor(.white)
                                .frame(alignment: .center)
                        } else {
                            Text("It's tails!")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 20))
                                .foregroundColor(.white)
                                .frame(alignment: .center)
                        }
                        
                        Spacer()
                        
                        Button {
//                            flip()
                            flipCoin()
//                            showingAlert = true
                        } label: {
                            Text("Flip a coin!")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60, alignment: .center)
                                .background(Color.init(red: 110/255, green: 140/255, blue: 160/255))
                                .cornerRadius(20)
                                .contentShape(Rectangle())
                        }
//                        .alert("Succesful Flip!", isPresented: $showingAlert) {
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
    
    func flipCoin() {
        withAnimation {
            let randomNumber = Int.random(in: 5...6)
            if degreesToFlip > 1800000000 {
                reset()
            }
            degreesToFlip = degreesToFlip + (randomNumber * 180)
            headsOrTails()
            isFlipping.toggle()
        }
    }
    
    func headsOrTails() {
        let divisible = degreesToFlip / 180
        (divisible % 2) == 0 ? (isHeads = false) : (isHeads = true)
    }
    
    func reset() {
        degreesToFlip = 0
    }
}

struct CoinFront : View {

    var body: some View {
        ZStack {
            Image("heads")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())

        }
    }
}

struct CoinBack : View {

    var body: some View {
        ZStack {
            Image("tails")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())

        }
    }
}

struct Coin: View {
    @Binding var isFlipping: Bool
    @Binding var isHeads: Bool
    var body: some View {
        ZStack {
            if (isHeads) { CoinFront() }
            else { CoinBack() }
        }
    }
}

struct FlipCoinView_Previews: PreviewProvider {
    static var previews: some View {
        FlipCoinView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
    }
}
