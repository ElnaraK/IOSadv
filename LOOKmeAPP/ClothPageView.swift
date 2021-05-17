//
//  ClothPageView.swift
//  LOOKme
//
//  Created by Elnara  on 5/13/21.
//

import SwiftUI

struct ClothPageView: View {
    
//    @EnvironmentObject var itemViewModel: ItemViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    let aWidth = width()/100*94
    @State var image: Image?
    
    var item: Cloth?
//    itemViewModel.items.first?.name, 
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            VStack{
                Rectangle()
                    .fill(Color(red: 0.827, green: 0.616, blue: 0.635))
                    .frame(width: width(), height: height()/5, alignment: .top)
                Spacer()
            }
            
            VStack(spacing: 40){
                
                Button(action: {
                    
                }){
                    ImageSelector(image: image)
                }
                
                VStack(spacing: 15){
                    TextFieldView(text: "Name")
                    TextFieldView(text: "Season")
                    TextFieldView(text: "Category")
                    
                }
                
                Section(title: "Looks")
                    .padding(.leading, (width()-aWidth)/2)
            }
        }.navigationBarBackButtonHidden(true)
        .navigationBarTitle("Jacket #1", displayMode: .inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
    
}

struct ClothPageView_Previews: PreviewProvider {
    static var previews: some View {
        ClothPageView()
    }
}
