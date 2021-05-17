//
//  LookDetailsView.swift
//  LOOKme
//
//  Created by Elnara  on 5/13/21.
//

import SwiftUI

struct LookDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    

    let aWidth = width()/100*94
    
    @State var title: String = ""
    @State var count: Int = 3
    @State var season: String = ""

    var body: some View {
        
        ScrollView {
            VStack(spacing: 40){
                VStack(spacing: 15){
                    TextFieldView(text: "Look title")
                    TextFieldView(text: "Season")
                    
                }
                
                ItemSelector(count: $count)
                
                
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("Look #1", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }.padding(.top, 10)
        
        
        
    }
}

struct LookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LookDetailsView()
    }
}
