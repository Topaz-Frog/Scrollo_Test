import SwiftUI

struct GeneratorAddRow: View {
    @EnvironmentObject var genManager: EventManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var generator: Generator
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10)
        {
            //MARK: Image
            Image(generator.image)
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.leading, 20)
            
            // MARK: Name and desc
            VStack(alignment: .leading, spacing: 5)
            {
                Text(generator.name)
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 200, alignment: .topLeading)
                
                Text(generator.description)
                    .font(Font.custom("Avenir", size: 12))
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    
                    //MARK: Add
                    Button {
                        genManager.addToAdded(generator: generator)
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                        .imageScale(.large)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    //MARK: Delete
                    Button {
                        genManager.removeFromList(generator: generator)
                    } label: {
                        Image(systemName: "delete.right")
                        .imageScale(.large)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
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

struct GeneratorAddRow_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneratorAddRow(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
    }
}
