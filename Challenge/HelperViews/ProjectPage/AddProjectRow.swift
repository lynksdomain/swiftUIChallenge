//
//  AddProjectRow.swift
//  Challenge
//
//  Created by Lynk on 1/29/21.
//

import SwiftUI

struct AddProjectRow: View {
    
    @Binding var presentAddView: Bool
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("borderColor"), lineWidth: 0.5))
            
            Button(action: {
                self.presentAddView.toggle()
            }, label: {
                Image("add")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            })
            .frame(width: 80, height: 80)
            .fullScreenCover(isPresented: $presentAddView, content: {
                AddProjectView(presentAddView: $presentAddView)
            })
            
        }
        .frame(height: 160.0)
        
    }
}



