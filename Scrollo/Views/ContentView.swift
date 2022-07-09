import SwiftUI

struct ContentView: View {
    @EnvironmentObject var eventManager: EventManager
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .leading) {
                    Spacer()
                    Group {
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
                    }
                    HStack(alignment: .bottom) {
                        Spacer()
                        
                        NavigationLink {
                            AnotherListView()
                                .environmentObject(eventManager)
                        } label: {
                            VStack {
                                Image(systemName: "dice.fill")
                                    .imageScale(.large)
                                    .font(.system(size: 30, weight: .bold))
                                    
                                Text("ROLL")
                                    .fontWeight(.medium)
                                    .font(Font.custom("Avenir", size: 18))
                            }
                            .foregroundColor(Constants.Colors.DarkBlueText)
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            GeneratorCreationView()
                                .environmentObject(eventManager)
                        } label: {
                            VStack {
                                Image(systemName: "plus.circle")
                                    .imageScale(.large)
                                    .font(.system(size: 32, weight: .bold))
                                    
                                Text("CREATE")
                                    .fontWeight(.medium)
                                    .font(Font.custom("Avenir", size: 18))
                            }
                            .foregroundColor(Constants.Colors.DarkBlueText)
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            AllGeneratorsView()
                                .environmentObject(eventManager)
                        } label: {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .imageScale(.large)
                                    .font(.system(size: 32, weight: .bold))
                                    
                                Text("SAVED")
                                    .fontWeight(.medium)
                                    .font(Font.custom("Avenir", size: 18))
                            }
                            .foregroundColor(Constants.Colors.DarkBlueText)
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
    //                        .foregroundColor(Constants.Colors.DarkBlueText)
    //                    }
    //
    //                    Spacer()
                    }
                    .background(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    .padding(.top, 5)
                }
                .foregroundColor(.white)
                .background(Color.init(red: 51/255, green: 72/255, blue: 86/255))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Log out") {
                            eventManager.updateValidation(success: false)
                        }.foregroundColor(.white)
                    }
                }
            }
            
            if isLoading { LoadingView(loadingTime: 3.0) }
        }
        .onAppear { startFakeNetworkCall() }
    }
    
    func startFakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EventManager())
    }
}
