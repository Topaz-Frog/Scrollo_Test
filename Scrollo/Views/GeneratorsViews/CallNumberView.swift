import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
    }
}

struct CallNumberView: View {
    @EnvironmentObject var genManager: EventManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var generator: Generator
    @State private var showingAlert = false
    @State var isCalled: Bool = false
    @State var value: CGFloat = 0
    @State var textMin: String = "0"
    @State var min: UInt32? = 0
    @State var textMax: String = "10"
    @State var max: UInt32? = 10
    
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
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 20) {
                        
//                        Text("Both numbers have to be integers [Minimum - Maximum)")
//                            .fontWeight(.black)
//                            .font(Font.custom("Avenir", size: 20))
//                            .foregroundColor(.white)
//                            .frame(alignment: .center)
                        
                        Background {
                            
                            HStack {
                                //MARK: Min field
                                VStack(alignment: .center) {
                                    Text("Minimum")
                                        .fontWeight(.black)
                                        .font(Font.custom("Avenir", size: 20))
                                        .frame(alignment: .center)
                                        .foregroundColor(Constants.Colors.OrangeBackground)
                                    TextField(textMin, text: $textMin)
                                        .font(.system(.body, design: .rounded))
                                        .foregroundColor(.white)
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .frame(height: 20)
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                                        )
                                        .padding(.vertical, 10)

                                }
                                
                                //MARK: Max field
                                VStack(alignment: .center) {
                                    Text("Maximum")
                                        .fontWeight(.black)
                                        .font(Font.custom("Avenir", size: 20))
                                        .frame(alignment: .center)
                                        .foregroundColor(Constants.Colors.OrangeBackground)
                                    TextField(textMax, text: $textMax)
                                        .font(.system(.body, design: .rounded))
                                        .foregroundColor(.white)
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .frame(height: 20)
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                                        )
                                        .padding(.vertical, 10)
                                }
                            }
                        }.onTapGesture {
                            self.endEditing()
                        }
                        
                        Spacer()
                        
                        //MARK: Button
                        Button {
                            withAnimation(Animation.easeOut(duration: 2)) {
//                                print("before: ", value)
                                callNum()
//                                print("after: ", value)
                                isCalled = true
                                showingAlert = true
                            }
                        } label: {
                            Text("I'm calling!")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60, alignment: .center)
                                .background(Color.init(red: 110/255, green: 140/255, blue: 160/255))
                                .cornerRadius(20)
                                .contentShape(Rectangle())
                        }
                        
                        Spacer()
                        
                        //MARK: Result
                        Circle()
                            .fill(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                            .frame(width: 200, height: 200)
                            .modifier(AnimatingNumberOverlay(number: value))
                        
                        Spacer()
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
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    private func callNum() {
        min = UInt32(textMin)
        max = UInt32(textMax)
        
        if Int(min!) > Int(max!) {
            min = UInt32(textMax)
            max = UInt32(textMin)
        }
        
        value = CGFloat(arc4random_uniform(max! - min!) + min!)
    }
}

// MARK: Number Animated
struct AnimatingNumberOverlay: AnimatableModifier {
    var number: CGFloat
    var animatableData: CGFloat {
        get {
            number
        }
        set {
            number = newValue
            
        }
    }
    
    func body(content: Content) -> some View {
//        print("returned: ", number)
        return content.overlay(Text("\(Int(number))")
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 40))
                                .frame(alignment: .center)
                                .foregroundColor(Color.init(red: 51/255, green: 72/255, blue: 86/255))
        )
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CallNumberView_Previews: PreviewProvider {
    static var previews: some View {
        CallNumberView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
    }
}
