import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var genManager: GeneratorsManager
    
    var body: some View {
        HStack(alignment: .bottom)
        {
            Spacer()
            
            //MARK: Roll
            NavigationLink {
                AnotherListView()
                    .environmentObject(genManager)
            } label: {
                VStack {
                    Image(systemName: "dice.fill")
                        .imageScale(.large)
                        .font(.system(size: 30, weight: .bold))
                        
                    Text("ROLL")
                        .fontWeight(.medium)
                        .font(Font.custom("Avenir", size: 18))
                }
                .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
            }
            
            Spacer()
            
            //MARK: Create
            NavigationLink {
                GeneratorCreationView()
                    .environmentObject(genManager)
            } label: {
                VStack {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .font(.system(size: 32, weight: .bold))
                        
                    Text("CREATE")
                        .fontWeight(.medium)
                        .font(Font.custom("Avenir", size: 18))
                }
                .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
            }
            
            Spacer()
            
            //MARK: Go to all
            NavigationLink {
                AllGeneratorsView()
                    .environmentObject(genManager)
            } label: {
                VStack {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.large)
                        .font(.system(size: 32, weight: .bold))
                        
                    Text("SHARED")
                        .fontWeight(.medium)
                        .font(Font.custom("Avenir", size: 18))
                }
                .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
            }
            
            Spacer()
        }
        .background(Color.init(red: 217/255, green: 125/255, blue: 84/255))
        .padding(.top, 5)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            Spacer()
            
            NavigationBar()
        }
    }
}
