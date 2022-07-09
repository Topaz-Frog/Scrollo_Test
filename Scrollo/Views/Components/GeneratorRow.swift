import SwiftUI

struct GeneratorRow: View {
    @Binding var generator: Generator
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10)
        {
            //MARK: Image
            Image(generator.image)
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.leading, 50)
            
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
            }
            .padding(.vertical)
            
            Spacer()
            
            //MARK: Forward
            Image("forward")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .padding(.trailing, CGFloat(50))
                .padding(.top, 30)
                .padding(.bottom, 30)
        }
        .background(Constants.Colors.LightBlueBackground)
        .frame(minWidth: 0, minHeight: 0)
        .cornerRadius(16)
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

struct GeneratorRow_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneratorRow(generator: .constant(Generator(name: "ENTER TOWN", image: "town", description: "Generate info about a town", content: "Not yet available", isImplemented: true)))
    }
}
