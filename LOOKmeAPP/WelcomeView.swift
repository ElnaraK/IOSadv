//
//  ContentView.swift
//  LOOKme
//
//  Created by Elnara  on 5/10/21.
//

import SwiftUI

struct WelcomeView: View {
        
//    @Environment(\.managedObjectContext) var viewContext
//    @FetchRequest(fetchRequest: Cloth.getAllClothes()) var clothes: FetchedResults<Cloth>
//    @ObservedObject var itemViewModel = ItemViewModel()
    
    @State private var toSign = false
    @State private var toRegister = false
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .center, spacing: 20){
                IconView()
                
                ZStack {
                    VStack(alignment: .center, spacing: 5){
                        
                        Button(action: {
                            toSign = true
                        }) {
                            Text("Sign in")
                                .font(Font.custom("Canela-Bold", size: width()/18))
                                .bold()
                                .frame(width: width()/100*53, height: height()/20)
                                .foregroundColor(.white)
                                .background(Color(red: 0.827, green: 0.616, blue: 0.635))
                        }.padding(0)
                        .cornerRadius(4)
                        
                        Button(action: {
                            toRegister = true
                        }) {
                            Text("Create account")
                                .font(Font.custom("Canela-Bold", size: width()/18))
                                .bold()
                                .frame(width: width()/100*53, height: height()/20)
                                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.557))
                            
                        }.padding(0)

                    }
                    NavigationLink(
                        "",
                        destination: SignInView(),
                        isActive: $toSign
                    )
                    NavigationLink(
                        "",
                        destination: RegistrationView(),
                        isActive: $toRegister
                    ).navigationBarHidden(true)
                }
                
                Spacer(minLength: height()/12)
            
            }.ignoresSafeArea(.all)
//            .environmentObject(itemViewModel)
        }.navigationViewStyle(StackNavigationViewStyle())

        
        
        
    }
}

func width() -> CGFloat{
    return (UIScreen.main.bounds.width)
}
func height() -> CGFloat{
    return (UIScreen.main.bounds.height)
}
private func signIn() -> CGFloat{
    return (UIScreen.main.bounds.height)
}
private func createAccount() -> CGFloat{
    return (UIScreen.main.bounds.height)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .previewDevice("iPhone 12 Pro")
    }
}

struct IconView: View {
    
    let posY = height()/5+height()/100*35/2
    
    var body: some View {
        ZStack{
            Ellipse()
                .fill(Color(red: 0.769, green: 0.769, blue: 0.769))
                .frame(width: height()/4, height: height()/4)
                .position(x: -width()/100*3+height()/8, y: height()/100*40+height()/8)
            Ellipse()
                .fill(Color(red: 0.827, green: 0.616, blue: 0.635))
                .frame(width: height()/100*35, height: height()/100*35)
                .position(x: width()/2, y: posY)
            Ellipse()
                .fill(Color(red: 1, green: 1, blue: 1))
                .frame(width: height()/100*30, height: height()/100*30)
                .position(x: width()/100*53+height()/100*30/2, y: posY)
            Text("LOOK  me")
                .foregroundColor(Color(red: 0, green: 0, blue: 0))
                .bold()
                .font(Font.custom("Canela-Bold", size: width()/9))
                .position(x: width()/100*40+20, y: posY)
        }
    }
}
