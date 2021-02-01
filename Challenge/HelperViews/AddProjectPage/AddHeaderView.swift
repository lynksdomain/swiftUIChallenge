//
//  AddHeaderView.swift
//  Challenge
//
//  Created by Lynk on 1/31/21.
//

import SwiftUI

struct AddHeaderView: View {
    
    @Binding var inputImage: UIImage?
    @Binding var selectedColor: Color
    @State var selectedCircle: Int = 0
    @State var showingImagePicker = false
    @State var project: Project?

    var colors: [Color] = [Color("dirtBrown"),Color("brick"),Color("mustard"),Color("washedGreen"),Color("washedBlue"),Color("grayish")]
    
    var body: some View {
        
        ZStack(alignment: .center) {
            selectedColor
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("borderColor"), lineWidth: 1))
            
            if let inputImage = inputImage {
                HStack {
                Image(uiImage: inputImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
            
                }.clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            
            VStack {
                Spacer()
                
                Button(action: {
                    showingImagePicker = true
                }, label: {
                    Image("upload")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 33.0, height: 30.0)
                    
                }).sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: self.$inputImage, selectedCircle: $selectedCircle)
                }
                
                Text("Upload header image or choose color")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .foregroundColor(Color("instructionGray"))
                
                
                HStack(alignment: .center) {
                    ForEach(0..<colors.count) {
                        CircleView(selectedColor: $selectedColor, selectedCircle: $selectedCircle, inputImage: $inputImage, color: colors[$0], circleID: $0+1)
                    }
                }.padding(.horizontal).frame(height: 30.0)
            }
            .padding(.bottom)
        
            
            
        }
        .frame(height: 160.0)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        

    }
}


