import SwiftUI

struct AllGeneratorsView: View {
    @EnvironmentObject var genManager: GeneratorsManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                //MARK: List Start
                List {
                    ForEach(genManager.allGenerators.indices, id: \.self) { i in
                        
                        //MARK: Row
                        if !genManager.isAdded(generator: genManager.allGenerators[i]) {
                            GeneratorAddRow(generator: $genManager.allGenerators[i])
                                .environmentObject(genManager)
                        }
                    }
                    .listRowBackground(Color.init(red: 51/255, green: 72/255, blue: 86/255))
                }
                .listStyle(.plain)
            }
            .background(Color.init(red: 51/255, green: 72/255, blue: 86/255))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })  {
                        Text("\(Image(systemName: "chevron.left")) \(" ")")
                            .foregroundColor(.white)
                }
            }
        }
    }
}

struct AllGeneratorsView_Previews: PreviewProvider {
    static var previews: some View {
        AllGeneratorsView()
    }
}
