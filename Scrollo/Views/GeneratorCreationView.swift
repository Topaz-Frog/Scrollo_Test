import SwiftUI

struct GeneratorCreationView: View {
    @EnvironmentObject var genManager: EventManager
    @Environment(\.presentationMode) var presentationMode
    @State var imageName: String = "dice"
    @State var name: String = "Name"
    @State var description: String = "Short description"
    @State var content: String = "content"
    @State var isImplem: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                
                //MARK: Name field
                VStack(alignment: .leading) {
                    Text("NAME")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    TextField("Fill in the generator name", text: $name)
                        .font(.system(.body, design: .rounded))
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 20)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                        )
                        .padding(.vertical, 10)

                }
                
                //MARK: Image field
                VStack(alignment: .leading) {
                    Text("IMAGE")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    TextField("Fill in the generator image name", text: $imageName)
                        .font(.system(.body, design: .rounded))
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 20)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                        )
                        .padding(.vertical, 10)

                }
                
                //MARK: Description field
                VStack(alignment: .leading) {
                    Text("DESCRIPTION")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    TextField("", text: $description)
                        .font(.system(.body, design: .rounded))
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 100, alignment: .top)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                        )
                        .padding(.vertical, 10)

                }
                
                //MARK: Content field
                VStack(alignment: .leading) {
                    Text("CONTENT")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                    TextField("", text: $content)
                        .font(.system(.body, design: .rounded))
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 200, alignment: .top)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                        )
                        .padding(.vertical, 10)

                }
                
                //MARK: Is implemented
                Toggle(isOn: $isImplem) {
                    Text("Is it implemented? (recommended false)")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
                }
            }
            .padding()
            .navigationTitle("New generator")
        }
        .background(Color.init(red: 51/255, green: 72/255, blue: 86/255))
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
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    saveGen()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    func saveGen() {
        genManager.addToList(generator: Generator(name: name, image: imageName, description: description, content: content, isImplemented: isImplem))
    }
}

struct FormTextField: View {
    let label: String
    var placeholder: String = ""
    var height: CGFloat = 20.0
    @Binding var value: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color.init(red: 217/255, green: 125/255, blue: 84/255))
            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .frame(height: height)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.init(red: 217/255, green: 125/255, blue: 84/255), lineWidth: 1)
                )
                .padding(.vertical, 10)

        }
    }
}

struct GeneratorCreationView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorCreationView()
    }
}
