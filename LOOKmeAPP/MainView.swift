//
//  MainView.swift
//  LOOKme
//
//  Created by Elnara  on 5/12/21.
//

import SwiftUI

struct MainView: View {
    
//    @EnvironmentObject var itemViewModel: ItemViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var addCloth = false
    @State private var myClothes = false
    @State private var makeLook = false
    @State private var myLooks = false
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 20){
            
            ZStack {
                HStack(spacing: -width()/10){
                    
                    VStack(spacing: 60){
                        
                        Button(action: {
                            myClothes = true
                        }) {
                            CircleText(text: "my clothes", backColor: Color(red: 0.557, green: 0.557, blue: 0.557), foreColor: Color.black)
                        }
                        
                        Button(action: {
                            myLooks = true
                        }) {
                            CircleText(text: "my looks", backColor: Color(red: 0.827, green: 0.616, blue: 0.635), foreColor: Color.white)
                        }
                        
                    }.frame(width: width()/2, height: width()/2*2.4+60, alignment: .bottom)
                    
                    VStack(spacing: 60){
                        
                        Button(action: {
                            addCloth = true
                        }) {
                            CircleText(text: "add cloth", backColor: Color(red: 0.827, green: 0.616, blue: 0.635), foreColor: Color.white)
                        }
                        
                        Button(action: {
                            makeLook = true
                        }) {
                            CircleText(text: "make look", backColor: Color(red: 0.769, green: 0.769, blue: 0.769), foreColor: Color.black)
                        }
                        
                    }.frame(width: width()/2, height: width()/2*2.4+60, alignment: .top)
                    .zIndex(-1)
                    
                }
                
                Group{
                    NavigationLink(
                        "",
                        destination: AddClothView(),
                        isActive: $addCloth
                    )
                    NavigationLink(
                        "",
                        destination: MyClothesView(),
                        isActive: $myClothes
                        )
                    NavigationLink(
                        "",
                        destination: MyLooksView(),
                        isActive: $myLooks
                        )
                    NavigationLink(
                        "",
                        destination: MakeLookView(),
                        isActive: $makeLook
                        )
                }
            }
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("sign out")
                    .font(Font.custom("Canela-Bold", size: width()/16))
                    .bold()
            }.padding(.horizontal, 30)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(Color(red: 0.827, green: 0.616, blue: 0.635))
            .cornerRadius(4)
            
            
        }.padding(.all, 30)
        .ignoresSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Look me", displayMode: .inline)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct CircleText: View {
    
    var text: String
    var backColor: Color
    var foreColor: Color
    
    var body: some View {
        Text(text)
            .bold()
            .frame(width: width()/2, height: width()/2, alignment: .center)
            .foregroundColor(foreColor)
            .font(Font.custom("Canela-Bold", size: width()/16))
            .background(backColor)
            .clipShape(Circle())
    }
}
