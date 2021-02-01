//
//  CircleView.swift
//  Challenge
//
//  Created by Lynk on 1/30/21.
//

import SwiftUI

struct CircleView: View {
    
    @Binding var selectedColor: Color
    @Binding var selectedCircle: Int
    @Binding var inputImage: UIImage?
    @State var color: Color
    @State var circleID: Int
    
    
    var body: some View {
        ZStack {
            
            if circleID != selectedCircle {
            Circle()
                .fill(color)
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    selectedColor = color
                    selectedCircle = circleID
                    inputImage = nil
                })
            } else {
                Circle()
                    .fill(color)
                    .overlay(
                        Circle().stroke(Color.black,lineWidth: 1)
                    )
                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                        selectedColor = color
                    })
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}


