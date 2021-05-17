//
//  RegistrationView.swift
//  LOOKme
//
//  Created by Elnara  on 5/12/21.
//

import SwiftUI

struct RegistrationView: View {
    
//    @EnvironmentObject var itemViewModel: ItemViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let aWidth = width()/100*94
    let aHeight = 40
    
    @State private var registered = false
    
    var body: some View {
        
        VStack(spacing: 15){
            VStack(spacing: 10){
                TextFieldView(text: "Enter your name")
                TextFieldView(text: "Enter your surname")
                TextFieldView(text: "Enter your username")
                SecureTextFieldView(text: "Enter your password")
                SecureTextFieldView(text: "Enter your password again")
                TextFieldView(text: "Enter your e-mail")
            }
            
            NavigationLink(
                "",
                destination: WelcomeView(),
                isActive: $registered
                ).navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Registration", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark")
                    }.foregroundColor(.black)
                }
            }
            .foregroundColor(.black)
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Register")
                    .font(Font.custom("Canela-Bold", size: width()/18))
                    .bold()
            }.padding(8)
            .frame(width: aWidth, height: CGFloat(aHeight))
            .foregroundColor(.white)
            .background(Color(red: 0.827, green: 0.616, blue: 0.635))
            .cornerRadius(4)
            
            Spacer()
        }.padding(.top, 10)
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
