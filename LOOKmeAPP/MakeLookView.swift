//
//  MakeLookView.swift
//  LOOKme
//
//  Created by Elnara  on 5/13/21.
//

import SwiftUI

struct MakeLookView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    

    let aWidth = width()/100*94
    
    @State var title: String = ""
    @State var count: Int = 3
    @State var season: String = ""

    var body: some View {
        
        ScrollView {
            VStack(spacing: 40){
                VStack(spacing: 15){
                    TextFieldView(value: title, text: "Enter look title")
                    
                    TextFieldView(text: "Enter number of items")
                    SegmentedPickerView(text: "Choose season")
                    
                }
                
                ItemSelector(count: $count)
                
                Button(action: {
                    print(title)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                        .font(Font.custom("Canela-Bold", size: width()/18))
                        .bold()
                }.padding(8)
                .frame(width: aWidth, height: 40)
                .foregroundColor(.white)
                .background(Color(red: 0.827, green: 0.616, blue: 0.635))
                .cornerRadius(4)
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("Add cloth", displayMode: .inline)
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

struct MakeLookView_Previews: PreviewProvider {
    static var previews: some View {
        MakeLookView()
    }
}


struct ItemSelector: View {
    
    @Binding var count: Int
    @State var image: Image?
    
    var body: some View {
        
        Group{
            ForEach(0 ..< count/2){_ in
                HStack(spacing: 30) {
                    ItemCircle()
                    ItemCircle()
                }
            }
            if(count % 2 != 0){
                HStack(spacing: 30) {
                    ItemCircle()
                    Spacer()
                }.padding(.horizontal, (width()-width()/2.5*2-30)/2)
            }
        }
    }
}

struct ItemCircle: View {
    var body: some View {
        Image("blouse")
            .resizable()
            .scaledToFill()
            .frame(width: width()/2.5, height: width()/2.5, alignment: .center)
            .clipShape(Circle())
    }
}
