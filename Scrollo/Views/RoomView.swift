import SwiftUI

struct RoomView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    
    @State var anim = ["Render_1_0001", "Render_1_0002", "Render_1_0003", "Render_1_0004", "Render_1_0005", "Render_1_0006", "Render_1_0007", "Render_1_0008", "Render_1_0009", "Render_1_0010", "Render_1_0011", "Render_1_0012", "Render_1_0013", "Render_1_0014", "Render_1_0015", "Render_1_0016", "Render_1_0017", "Render_1_0018", "Render_1_0019", "Render_1_0020", "Render_1_0021", "Render_1_0022", "Render_1_0023", "Render_1_0024", "Render_1_0025", "Render_1_0026", "Render_1_0027", "Render_1_0028", "Render_1_0029", "Render_1_0030", "Render_1_0031", "Render_1_0032", "Render_1_0033", "Render_1_0034", "Render_1_0035", "Render_1_0036", "Render_1_0037", "Render_1_0038", "Render_1_0039", "Render_1_0040", "Render_1_0041", "Render_1_0042", "Render_1_0043", "Render_1_0044", "Render_1_0045", "Render_1_0046", "Render_1_0047", "Render_1_0048", "Render_1_0049", "Render_1_0050", "Render_1_0051", "Render_1_0052", "Render_1_0053", "Render_1_0054", "Render_1_0055", "Render_1_0056", "Render_1_0057", "Render_1_0058", "Render_1_0059", "Render_1_0060", "Render_1_0061", "Render_1_0062", "Render_1_0063", "Render_1_0064", "Render_1_0065", "Render_1_0066", "Render_1_0067", "Render_1_0068", "Render_1_0069", "Render_1_0070", "Render_1_0071", "Render_1_0072", "Render_1_0073", "Render_1_0074", "Render_1_0075", "Render_1_0076", "Render_1_0077", "Render_1_0078", "Render_1_0079", "Render_1_0080", "Render_1_0081", "Render_1_0082", "Render_1_0083", "Render_1_0084", "Render_1_0085", "Render_1_0086", "Render_1_0087", "Render_1_0088", "Render_1_0089", "Render_1_0090", "Render_1_0091", "Render_1_0092", "Render_1_0093", "Render_1_0094", "Render_1_0095", "Render_1_0096", "Render_1_0097", "Render_1_0098", "Render_1_0099", "Render_1_0100", "Render_1_0101", "Render_1_0102", "Render_1_0103", "Render_1_0104", "Render_1_0105", "Render_1_0106", "Render_1_0107", "Render_1_0108", "Render_1_0109", "Render_1_0110", "Render_1_0111", "Render_1_0112", "Render_1_0113", "Render_1_0114", "Render_1_0115", "Render_1_0116", "Render_1_0117", "Render_1_0118", "Render_1_0119", "Render_1_0120", "Render_1_0121", "Render_1_0122", "Render_1_0123", "Render_1_0124", "Render_1_0125", "Render_1_0126", "Render_1_0127", "Render_1_0128", "Render_1_0129", "Render_1_0130", "Render_1_0131", "Render_1_0132", "Render_1_0133", "Render_1_0134", "Render_1_0135", "Render_1_0136", "Render_1_0137", "Render_1_0138", "Render_1_0139", "Render_1_0140", "Render_1_0141", "Render_1_0142", "Render_1_0143", "Render_1_0144", "Render_1_0145", "Render_1_0146", "Render_1_0147", "Render_1_0148", "Render_1_0149", "Render_1_0150", "Render_1_0151", "Render_1_0152", "Render_1_0153", "Render_1_0154", "Render_1_0155", "Render_1_0156", "Render_1_0157", "Render_1_0158", "Render_1_0159", "Render_1_0160", "Render_1_0161", "Render_1_0162", "Render_1_0163", "Render_1_0164", "Render_1_0165", "Render_1_0166", "Render_1_0167", "Render_1_0168", "Render_1_0169", "Render_1_0170", "Render_1_0171", "Render_1_0172", "Render_1_0173", "Render_1_0174", "Render_1_0175", "Render_1_0176", "Render_1_0177", "Render_1_0178", "Render_1_0179", "Render_1_0180", "Render_1_0181", "Render_1_0182", "Render_1_0183", "Render_1_0184", "Render_1_0185", "Render_1_0186", "Render_1_0187", "Render_1_0188", "Render_1_0189", "Render_1_0190", "Render_1_0191", "Render_1_0192", "Render_1_0193", "Render_1_0194", "Render_1_0195", "Render_1_0196", "Render_1_0197", "Render_1_0198", "Render_1_0199", "Render_1_0200", "Render_1_0201", "Render_1_0202", "Render_1_0203", "Render_1_0204", "Render_1_0205", "Render_1_0206", "Render_1_0207", "Render_1_0208", "Render_1_0209", "Render_1_0210", "Render_1_0211", "Render_1_0212", "Render_1_0213", "Render_1_0214", "Render_1_0215", "Render_1_0216", "Render_1_0217", "Render_1_0218", "Render_1_0219", "Render_1_0220", "Render_1_0221", "Render_1_0222", "Render_1_0223", "Render_1_0224", "Render_1_0225", "Render_1_0226", "Render_1_0227", "Render_1_0228", "Render_1_0229", "Render_1_0230", "Render_1_0231", "Render_1_0232", "Render_1_0233", "Render_1_0234", "Render_1_0235", "Render_1_0236", "Render_1_0237", "Render_1_0238", "Render_1_0239", "Render_1_0240"]
    @State private var frame: Double = 1
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Spacer()
            
            //MARK: Image
            ZStack(alignment: .topTrailing) {
                Image(anim[Int(frame) - 1])
                    .resizable()
                    .scaledToFit()
                
                if (frame >= 35.0 && frame <= 65.0) {
                    Button {
                        openURL(URL(string: "https://www.mediaexpert.pl/telewizory-i-rtv/telewizory/telewizor-samsung-led-ue55au7192-uhd-hdr-10-tv-2021")!)
                    } label: {
                        Image(systemName: "link.circle.fill")
                            .imageScale(.large)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    }
                } else if (frame >= 100.0 && frame <= 145.0) {
                    Button {
                        openURL(URL(string: "https://www.ikea.com/pl/pl/p/kallax-regal-bialy-80275887/")!)
                    } label: {
                        Image(systemName: "link.circle.fill")
                            .imageScale(.large)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    }
                } else if (frame >= 170.0 && frame <= 200.0) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "link.circle.fill")
                            .imageScale(.large)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    }
                    .alert("Don't open the Pandora box", isPresented: $showingAlert) {
                        Button("Sorry", role: .cancel) { }
                    }
                }
            }
            
            Spacer()
            
            Slider(
                value: $frame,
                in: 1...240,
                step: 1
            )
            Text("")
                .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
        }
        .background(Color.init(red: 50/255, green: 71/255, blue: 75/255))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })  {
                        Text("\(Image(systemName: "chevron.left")) \(" Leave")")
                            .foregroundColor(.white)
                }
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
