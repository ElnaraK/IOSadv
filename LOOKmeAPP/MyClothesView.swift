//
//  MyClothesView.swift
//  LOOKme
//
//  Created by Elnara  on 5/13/21.
//

import SwiftUI

struct MyClothesView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let aWidth = width()/100*94
    let aHeight = 40
    
    @State var value: String = ""
    @State var text: String = ""
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15){
                TextField("Search", text: $value)
                    .padding()
                    .frame(width: aWidth, height: CGFloat(aHeight))
                    .cornerRadius(8)
                    .background(Color(red: 0.898, green: 0.898, blue: 0.898))
                    .border(Color(red: 0.769, green: 0.769, blue: 0.769), width: 0.5)
                    .cornerRadius(4)
                
                VStack(alignment: .leading, spacing: 15){
                    Section(title: "Jackets")
                    Section(title: "Jackets")
                    Section(title: "Jackets")
                    Section(title: "Jackets")
                }.padding(.leading, (width()-aWidth)/2)
            
                
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("My clothes", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }.padding(.top, 25)
        
    }
}

struct MyClothesView_Previews: PreviewProvider {
    static var previews: some View {
        MyClothesView()
    }
}

struct Section: View {
    
    let aWidth = width()/100*94
    
    @State var title: String
    @State private var toDetails = false
    @State private var toLookDetails = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(title)
                .font(Font.custom("Inter", size: 24))
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    HStack(alignment: .top ,spacing: 12){
                        ItemCard()
                            .onTapGesture(perform: {
                                toDetails = true
                            })
                        ItemCard()
                            .onTapGesture(perform: {
                                toLookDetails = true
                            })
                        ItemCard()
                        ItemCard()
                        ItemCard()
                    }
                    
                    NavigationLink(
                        "",
                        destination: ClothPageView(),
                        isActive: $toDetails
                    )
                    
                    NavigationLink(
                        "",
                        destination: LookDetailsView(),
                        isActive: $toLookDetails
                    )
                }
            }
        }
        
    }
}

struct ItemCard: View {
    
    var body: some View {
        VStack(spacing: 8){
            Image("blouse")
                .resizable()
                .scaledToFill()
                .frame(width: width()/3, height: width()/3)
                .cornerRadius(8.0)
                .clipped()
            Text("Blouse 1")
                .font(Font.custom("Inter", size: 14))
                .frame(width: width()/3, height: 34, alignment: .topLeading)
        }
    }
}
