import SwiftUI

struct ContentView: View {
    @EnvironmentObject var genManager: EventManager
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Random")
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 72))
                    .padding(.vertical, -20)
                    .padding(.horizontal)
                
                Text("Stuff")
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 96))
                    .padding(.vertical, -20)
                    .padding(.horizontal)
                
                Text("Let's get started!")
                    .fontWeight(.black)
                    .font(Font.custom("Avenir", size: 20))
                    .foregroundColor(.white)
                    .padding(.vertical, 0)
                    .padding(.horizontal)
                
                HStack(alignment: .bottom)
                {
                    Spacer()
                    
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
                    
                    NavigationLink {
                        AllGeneratorsView()
                            .environmentObject(genManager)
                    } label: {
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                                .imageScale(.large)
                                .font(.system(size: 32, weight: .bold))
                                
                            Text("SAVED")
                                .fontWeight(.medium)
                                .font(Font.custom("Avenir", size: 18))
                        }
                        .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
                    }
                        
                    Spacer()
                    
//                    NavigationLink {
//                        RoomView()
//                    } label: {
//                        VStack {
//                            Image(systemName: "link.circle")
//                                .imageScale(.large)
//                                .font(.system(size: 32, weight: .bold))
//
//                            Text("ROOM")
//                                .fontWeight(.medium)
//                                .font(Font.custom("Avenir", size: 18))
//                        }
//                        .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
//                    }
//
//                    Spacer()
                }
                .background(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                .padding(.top, 5)
            }
            .foregroundColor(.white)
            .background(Color.init(red: 51/255, green: 72/255, blue: 86/255))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
