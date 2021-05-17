//
//  MyLooksView.swift
//  LOOKme
//
//  Created by Elnara  on 5/13/21.
//

import SwiftUI

struct MyLooksView: View {
    
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
                    .background(Color(red: 0.898, green: 0.898, blue: 0.898))
                    .border(Color(red: 0.769, green: 0.769, blue: 0.769), width: 0.5)
                    .cornerRadius(4)
                
                VStack(alignment: .leading, spacing: 15){
                    Section(title: "Winter")
                    Section(title: "Summer")
                    Section(title: "Demi")
                }.padding(.leading, (width()-aWidth)/2)
            
                
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("My looks", displayMode: .inline)
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

struct MyLooksView_Previews: PreviewProvider {
    static var previews: some View {
        MyLooksView()
    }
}
