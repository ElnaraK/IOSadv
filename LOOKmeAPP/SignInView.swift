//
//  SignInViewController.swift
//  LOOKme
//
//  Created by Elnara  on 5/11/21.
//

import SwiftUI

struct SignInView: View {
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = .clear
//        UINavigationBar.appearance().largeTitleTextAttributes = [
//            .foregroundColor: UIColor.black,
//            .font : UIFont(name:"Canela-Bold", size: width()/18)!]
//    }

    
//    let roseColor = UIColor(red: 0.827, green: 0.616, blue: 0.635, alpha: 1)
    
//    @EnvironmentObject var itemViewModel: ItemViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let aWidth = width()/100*94
    let aHeight = 40
    
    @State private var signed = false
    
    var body: some View {
        
        VStack(spacing: 15){
            VStack(spacing: 10){
                TextFieldView(text: "Username")
                SecureTextFieldView(text: "Password")
            }
            
            NavigationLink(
                "",
                destination: MainView(),
                isActive: $signed
                ).edgesIgnoringSafeArea(.top)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Sign in", displayMode: .inline)
//            .background(NavigationConfigurator { nc in
//                nc.navigationBar.backgroundColor = UIColor.blue
//                nc.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark")
                            .background(Color.black)
                    }.foregroundColor(.black)
                }
            }
            
            Button(action: {
               signed = true
            }) {
                Text("Start")
                    .font(Font.custom("Canela-Regular", size: width()/18))
                    
            }.padding(8)
            .frame(width: aWidth, height: CGFloat(aHeight))
            .foregroundColor(.white)
            .background(Color(red: 0.827, green: 0.616, blue: 0.635))
            .cornerRadius(4)
            
            Spacer()
        }.padding(.top, 10)
        .foregroundColor(.black)
        
    }
}

struct SignInViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
        }
    }
}

struct TextFieldView: View {
    
    let aWidth = width()/100*94
    let aHeight = 40
    
    @State var value: String = ""
    
    @State var text: String = ""
        
    var body: some View {
        VStack(spacing:5){
            Text(text)
                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.557))
                .font(Font.custom("Inter", size: 12))
                .padding(5)
                .frame(width: aWidth, alignment: .leading)
            TextField("", text: $value)
                .disableAutocorrection(true)
                .padding()
                .frame(width: aWidth, height: CGFloat(aHeight))
                .background(Color(red: 0.898, green: 0.898, blue: 0.898))
                .border(Color(red: 0.769, green: 0.769, blue: 0.769), width: 0.5)
                .cornerRadius(4)
        }
    }
}

struct SecureTextFieldView: View {
    
    let aWidth = width()/100*94
    let aHeight = 40
    
    @State var username: String = ""
    
    @State var text: String = ""
        
    var body: some View {
        VStack(spacing:5){
            Text(text)
                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.557))
                .font(Font.custom("Inter", size: 12))
                .padding(5)
                .frame(width: aWidth, alignment: .leading)
            SecureField("", text: $username)
                .padding()
                .frame(width: aWidth, height: CGFloat(aHeight))
                .background(Color(red: 0.898, green: 0.898, blue: 0.898))
                .border(Color(red: 0.769, green: 0.769, blue: 0.769), width: 0.5)
                .cornerRadius(4)
        }
    }
}

//struct NavigationConfigurator: UIViewControllerRepresentable {
//    var configure: (UINavigationController) -> Void = { _ in }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
//        UIViewController()
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
//        if let nc = uiViewController.navigationController {
//            self.configure(nc)
//        }
//    }
//
//}
