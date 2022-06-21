import SwiftUI

struct TitleBar: View {
    var body: some View {
        HStack(alignment: .bottom)
        {
            Text("RandomStuff")
                .fontWeight(.black)
                .font(Font.custom("Avenir", size: 30))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Spacer()
            
//            Image(systemName: "pencil.circle")
//                .imageScale(.large)
//                .font(.system(size: 30, weight: .bold))
//                .foregroundColor(Color.init(red: 50/255, green: 71/255, blue: 75/255))
//                .padding(.horizontal)
        }
        .background(Color.init(red: 217/255, green: 125/255, blue: 84/255))
        .padding(.bottom, 5)
    }
}

struct TitleBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleBar()
            
            Spacer()
        }
    }
}
