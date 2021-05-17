//
//  AddClothView.swift
//  LOOKme
//
//  Created by Elnara  on 5/13/21.
//

import SwiftUI

struct AddClothView: View {
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = .clear
//        UINavigationBar.appearance().largeTitleTextAttributes = [
//            .foregroundColor: UIColor.black,
//            .font : UIFont(name:"Canela-Bold", size: width()/18)!]
//    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var tapped = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var image: Image?
        
    let aWidth = width()/100*94
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            VStack{
                Rectangle()
                    .fill(Color(red: 0.827, green: 0.616, blue: 0.635))
                    .frame(width: width(), height: height()/5, alignment: .top)
//                    .ignoresSafeArea(.all)
                    
                Spacer()
            }
            
            VStack(spacing: 40){
                
                Button(action: {
                    showingImagePicker = true
                }){
                    ImageSelector(image: image)
                }
                
                VStack(spacing: 15){
                    TextFieldView(text: "Enter item name")
                    SegmentedPickerView(text: "Choose season")
                    WheelPickerView(text: "Choose category")
                }
                
                Button(action: {
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
                
            }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
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
//        .background(NavigationConfigurator { nc in
//            let color = UIColor(red: 0.827, green: 0.616, blue: 0.635, alpha: 1)
//            nc.navigationBar.barTintColor = color
//            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
//        })
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        print(inputImage, "1")
        image = Image(uiImage: inputImage)
//        print(image, "2")
    }
}

struct AddClothView_Previews: PreviewProvider {
    static var previews: some View {
        AddClothView()
    }
}

struct ImageSelector: View {
    
    @State var image: Image?
    
    var body: some View {
        if image != nil{
            image?
                .resizable()
                .scaledToFill()
                .frame(width: width()/2, height: width()/2, alignment: .center)
                .clipShape(Circle())
                .padding(.top, height()/12)
        }else{
            Image("blouse")
                .resizable()
                .scaledToFill()
                .frame(width: width()/2, height: width()/2, alignment: .center)
                .clipShape(Circle())
                .padding(.top, height()/12)
        }
    }
}

struct SegmentedPickerView: View {
    
    let aWidth = width()/100*94
        
    @State private var selectedSeasonIndex = 2
    @State var text: String = ""
        
    var body: some View {
        VStack(spacing:5){
            Text(text)
                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.557))
                .font(Font.custom("Inter", size: 12))
                .padding(5)
                .frame(width: aWidth, alignment: .leading)
            Picker("Season", selection: $selectedSeasonIndex, content: {
                Text("Summer").tag(0)
                Text("Winter").tag(1)
                Text("Fall/Spring").tag(2)
                Text("Demi").tag(3)
            }).pickerStyle(SegmentedPickerStyle())
            .frame(width: aWidth, height: CGFloat(40))
            .cornerRadius(4)
        }
    }
}

struct WheelPickerView: View {
    
    let aWidth = width()/100*94
        
    @State private var selectedCategoryIndex = 3
    @State var text: String = ""
        
    var body: some View {
        VStack(spacing:20){
            Text(text)
                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.557))
                .font(Font.custom("Inter", size: 12))
                .padding(5)
                .frame(width: aWidth, alignment: .leading)
            Picker("Category", selection: $selectedCategoryIndex, content: {
                Text("Dresses").tag(0)
                Text("Jeans").tag(1)
                Text("Skirts").tag(2)
                Text("Tops").tag(3)
            }).pickerStyle(WheelPickerStyle())
            .frame(width: aWidth, height: 120)
            .clipped()
        }
    }
}
