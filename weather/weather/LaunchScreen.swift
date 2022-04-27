//
//  LaunchScreen.swift
//  weather_swiftUI
//
//  Created by yoji on 4/27/22.
//

import SwiftUI
import Combine

struct LaunchScreen: View {
    
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    
    private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true }, NotificationCenter.default.publisher(
            for:
                UIResponder.keyboardWillHideNotification) .map { _ in false }
    )
        .removeDuplicates()
    
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { _ in Image("sunny_weather")
                    .resizable() .edgesIgnoringSafeArea(.all)
            }
            
            
            ScrollView(showsIndicators: false) {
                
                VStack {
                    if shouldShowLogo {
                        Text("Weather App") .font(.largeTitle) .padding(.top, 32)
                    }
                    
                    VStack {
                        
                        HStack {
                            Text("Login:")
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150) .textFieldStyle(RoundedBorderTextFieldStyle())
                        };
                        
                        HStack {
                            Text("Password:")
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150) .textFieldStyle(RoundedBorderTextFieldStyle())
                        } }
                    .frame(maxWidth: 250)
                    .padding(.top, 50)
                    
                    Button(action: { print("Hello") }) {
                        Text("Log in") }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                    .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) {
                            self.shouldShowLogo = !isKeyboardOn }
                        } }
                .onTapGesture {
                //UIApplication.shared.endEditing()
                    
                }
            } }
        
        
    }
}

//extension UIApplication { func endEditing() {
//            sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        } }


struct LaunchScreen_Previews: PreviewProvider {
            static var previews: some View {
                LaunchScreen()
            }
        }
