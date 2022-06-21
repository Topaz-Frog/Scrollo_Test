import SwiftUI

struct GeneratorDetailsView: View {
    @EnvironmentObject var genManager: GeneratorsManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var generator: Generator
    
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
                    genManager.removeFromList(generator: generator)
                } label: {
                    Image(systemName: "trash.circle")
                        .imageScale(.large)
                        .font(.system(size: 26, weight: .bold))
                }
            }
            .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
            
            HStack(alignment: .top, spacing: 15) {
                
                Color(red: 217/255, green: 125/255, blue: 84/255)
                    .frame(width: 50)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 20) {
                        
                        Text(generator.description)
                            .fontWeight(.black)
                            .font(Font.custom("Avenir", size: 20))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                        
                        Text(generator.content)
                            .fontWeight(.black)
                            .font(Font.custom("Avenir", size: 20))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                        
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
}

struct GeneratorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorDetailsView(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
    }
}
