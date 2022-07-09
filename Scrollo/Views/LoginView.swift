//
//  LoginView.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 09/07/2022.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var eventManager: EventManager
    var body: some View {
        Group {
            VStack {
                Background {
                    VStack(alignment: .leading) {
                        Group {
                            HStack {
                                Text("Random")
                                    .fontWeight(.black)
                                    .font(Font.custom("Avenir", size: 72))
                                    .padding(.vertical, -20)
//                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            
                            Text("Stuff")
                                .foregroundColor(Constants.Colors.OrangeBackground)
                                .fontWeight(.black)
                                .font(Font.custom("Avenir", size: 96))
                                .padding(.vertical, -20)
//                                .padding(.horizontal)
                        }
                        
                    }
                    .padding(.top, 100)
                    
                    TextField("Email Address", text: $loginVM.credentials.email)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $loginVM.credentials.password)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            loginVM.login { success in
                                eventManager.updateValidation(success: success)
                            }
                        } label: {
                            Text("Login")
                                .font(Constants.Fonts.DefaultText)
                                .foregroundColor(Constants.Colors.DarkBlueText)
                                .padding(.horizontal)
                        }
                        .buttonStyle(GrowingButton(background_color: Constants.Colors.OrangeBackground))
                        .disabled(loginVM.loginDisabled)
                    }
                    .padding(.bottom,20)
                    .padding(.horizontal,20)
                    
                    if eventManager.biometricType() != .none {
                        Button {
                            eventManager.requestBiometricUnlock { (result:Result<Credentials, EventManager.AuthenticationError>) in
                                switch result {
                                case .success(let credentials):
                                    loginVM.credentials = credentials
                                    loginVM.login { success in
                                        eventManager.updateValidation(success: success)
                                    }
                                case .failure(let error):
                                    loginVM.error = error
                                }
                            }
                        } label: {
                            Image(systemName: eventManager.biometricType() == .face ? "faceid" : "touchid")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    
                    Spacer()
                    
                    Image("app_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
            .foregroundColor(.white)
            .autocapitalization(.none)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .disabled(loginVM.showProgressView)
            .alert(item: $loginVM.error) { error in
                if error == .credentialsNotSaved {
                    return Alert(title: Text("Credentials not saved"),
                                 message: Text(error.localizedDescription),
                                 primaryButton: .default(Text("OK"), action: {
                                    loginVM.storeCredentialsNext = true
                                 }),
                                 secondaryButton: .cancel())
                } else {
                    return Alert(title: Text("Invlid Login"),
                                 message: Text(error.localizedDescription))
                }
            }
        }
        .background(Constants.Colors.DarkBlueBackground)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(EventManager())
    }
}
